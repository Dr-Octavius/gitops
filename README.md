# ☁️ GitOps 

> Declarative GitOps management for Kubernetes platform services using Argo CD, Terraform, and Helm

## 📦 Overview
This repository forms the backbone of our Kubernetes GitOps strategy. It houses Argo CD-managed applications for:

- 🚀 Argo CD itself
- 📊 Logging & Observability stack (ECK, FluentD, Grafana, Prometheus, Kiali, Jaeger)
- 🔐 Service Mesh (Istio)
- 🧠 Custom business applications (image-built, deployed via manifests)

All platform services are orchestrated via **Argo CD** in a modular, multi-repo structure.

---

## 🧩 Repository Structure
```
platform-gitops/
├── .idea                   # Dev Workspace Folder
├── apps/                   # App of Apps pattern for Argo CD
│   └── argo-cd
│       ├── install.yaml
│       └── kustomization.yaml
├── lib/                   # Knowledge management in a reference library
│   ├── argo-cd
│   └── kubernetes
├── terraform/             # Terraform modules for argo-cd in different environments
│   ├── dev
│   ├── staging
│   └── prod
└── README.md              # You are here
```

---

## 🚀 GitOps Bootstrap Flow

1. **Provision cluster** with Terraform (separate repo: `COSMOS`)
2. **Install Argo CD** via Helm or Terraform Helm provider
3. **Bootstrap GitOps** using an App-of-Apps pointing to `apps/`
4. **Argo CD manages:**
    - Logging Stack (Elasticsearch, FluentD)
    - Observability Stack (Istio, Prometheus, Grafana, Jaeger)
    - Business Apps (CI-built + manifest-deployed)

---

## 🔐 Argo CD Installation & Security

### 🔸 Option 1: Secure Production Install (Recommended)
- Use TLS certs via a pre-created Kubernetes TLS Secret
- Example Helm config:
```yaml
server:
  certificate:
    enabled: true
    secretName: my-custom-cert
```
- Provision cert using Let's Encrypt, corporate CA, or manually

### 🔸 Option 2: Local / Dev Convenience
- Access via port-forward:
  ```bash
  kubectl port-forward svc/argocd-server -n argocd 8080:443
  ```
- Or use `--insecure` flag for CLI/dev-only login

### 🔸 Trust Self-Signed Cert (Dev Secure Option)
Export & trust the cert manually:
```bash
# Extract cert
openssl s_client -showcerts -connect argocd.example.com:443 \
  | sed -ne '/-BEGIN CERTIFICATE-/,/-END CERTIFICATE-/p' > argocd.crt

# On Ubuntu
sudo cp argocd.crt /usr/local/share/ca-certificates/argocd.crt && sudo update-ca-certificates
```

---

## 📜 Why Argo CD Doesn’t Need an Operator
- Argo CD **is the controller** for its own CRDs (`Application`, `AppProject`)
- No additional abstraction layer needed (unlike ECK, Istio)
- Its own reconciliation loop keeps drift in check

> ✅ Argo CD does not require a separate operator — it watches Git and enforces the declared state.

---

## 🛠️ Component Deployment Philosophy

| Component         | Deploy With     | Notes                                  |
|------------------|------------------|----------------------------------------|
| Argo CD          | Terraform + Helm | Initial control plane setup            |
| Elastic Stack    | Terraform + YAML | Operator-managed (ECK)                 |
| FluentD          | Terraform (DS)   | Deployed as DaemonSet                  |
| Istio Stack      | Helm + Manifests | Istio base + addons via Argo CD        |
| Business Apps    | Kubernetes YAML  | Image CI → Git update → Argo sync      |

---

## 📁 Multi-Repo Architecture

This GitOps repo only holds Argo CD apps and core GitOps configuration. Platform stacks live in their own repos:

| Repo               | Purpose                          |
|--------------------|----------------------------------|
| `platform-gitops`  | Argo CD apps + GitOps metadata   |
| `infra-logging`    | ECK, FluentD, Kibana             |
| `infra-observability` | Istio, Prometheus, Grafana     |
| `business-apps`    | Business-specific workloads      |
| `COSMOS`           | Cluster provisioning (Terraform) |

---

## 📈 Scaling Argo CD
- Runs fine in default node pool for <100 apps
- Watch `application-controller` memory usage
- For high-scale: isolate into own node pool and increase pod resources

---

## ✅ Final Notes

- Argo CD’s value compounds over time — once it's installed and secured, **it automates your entire platform lifecycle**
- Drift protection, auditability, and rollback come out of the box
- Git becomes your single source of truth for infra and apps

> GitOps is not "just another deployment method" — it's an **operational contract** between your team and the cluster.

---

For any questions or to contribute, open a PR or reach out via the platform team.

