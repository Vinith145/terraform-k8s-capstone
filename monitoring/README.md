# Monitoring Stack — Prometheus + Grafana

This folder contains Kubernetes manifests for deploying a lightweight monitoring stack alongside the capstone application.

## Components

### Prometheus

- Deployed as a `Deployment` with a `NodePort` Service (port 30090)
- Uses RBAC (`ClusterRole` + `ServiceAccount`) to discover pods in the `capstone` namespace
- Scrapes metrics from:
  - Itself (`localhost:9090`)
  - Any pod with annotation `prometheus.io/scrape: "true"`
- Storage: `emptyDir` (ephemeral, fine for local development)

### Grafana

- Deployed as a `Deployment` with a `NodePort` Service (port 30030)
- Auto-provisions Prometheus as the default datasource via ConfigMap
- Default credentials: `admin` / `admin123`

## How to Access

```bash
# Prometheus UI
kubectl port-forward -n capstone service/prometheus-service 9090:9090
# Then open http://localhost:9090

# Grafana UI
kubectl port-forward -n capstone service/grafana-service 3001:3000
# Then open http://localhost:3001
# Login: admin / admin123
```

### What to Explore in Prometheus

Try these queries in the Prometheus UI:

- `up` — check target health
- `container_memory_usage_bytes{namespace="capstone"}` — memory usage per pod
- `container_cpu_usage_seconds_total{namespace="capstone"}` — CPU usage
- `kube_pod_status_ready{namespace="capstone"}` — pod readiness


### What to Explore in Grafana

After logging in:
- Go to Explore (compass icon)
- Select Prometheus datasource
- Run `up` or `container_memory_usage_bytes{namespace="capstone"}`

Or import a community dashboard:

- Dashboard ID 6417 — Kubernetes Cluster (Prometheus)
- Dashboard ID 315 — Kubernetes cluster monitoring