#!/bin/bash
# cleanup.sh - Tear down the capstone Kubernetes resources
# Usage: ./scripts/cleanup.sh

set -euo pipefail

echo "=========================================="
echo " Capstone Cleanup"
echo "=========================================="

echo "[1/2] Deleting capstone namespace..."
kubectl delete namespace capstone --ignore-not-found=true

echo "[2/2] Stopping Minikube..."
minikube stop

echo ""
echo "=========================================="
echo " Cleanup complete!"
echo "=========================================="
echo ""
echo "To destroy Azure infrastructure:"
echo "  cd terraform && terraform destroy"
echo ""