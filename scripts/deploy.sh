#!/bin/bash
# deploy.sh - Deploy the capstone app and monitoring stack to Kubernetes
# Usage: ./scripts/deploy.sh

set -euo pipefail

echo "=========================================="
echo " Capstone Deployment"
echo "=========================================="

echo "[1/4] Checking Minikube status..."
if ! minikube status >/dev/null 2>&1; then
  echo "  Minikube is not running. Starting it..."
  minikube start --driver=docker --cpus=2 --memory=4096
else
  echo "  Minikube is running"
fi

echo "[2/4] Loading application image into Minikube..."
minikube image load docker-cicd-pipeline:latest || \
  echo "  Warning: could not load image. Make sure it's built locally."

echo "[3/4] Applying Kubernetes manifests..."
kubectl apply -f k8s/

echo "[4/4] Applying monitoring stack..."
kubectl apply -f monitoring/

echo ""
echo "=========================================="
echo " Deployment complete!"
echo "=========================================="
echo ""
echo "Check pods:    kubectl get pods -n capstone"
echo "Access app:    kubectl port-forward -n capstone service/capstone-app-service 8080:80"
echo "Access Prom:   kubectl port-forward -n capstone service/prometheus-service 9090:9090"
echo "Access Grafana: kubectl port-forward -n capstone service/grafana-service 3001:3000"
echo ""