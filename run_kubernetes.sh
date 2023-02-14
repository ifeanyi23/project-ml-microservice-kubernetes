#!/usr/bin/env bash

# This tags and uploads an image to Docker Hub

# Step 1:
# This is your Docker ID/path
dockerpath=joey97/demoimage:v1.0.0

# Step 2
# Run the Docker Hub container with kubernetes
kubectl run demopod --image=$dockerpath --port=80 --labels="app=demopod"

# Step 3:
# List kubernetes pods
kubectl get pods
# Step 4:
# Forward the container port to a host
# kubectl expose pod demopod --type=NodePort --port=80 --name=test-service

# # kubectl edit service test-service
# kubectl logs -f demopod
# kubectl get endpoints
kubectl port-forward demopod 5000:80
# kubectl port-forward demopod 8000:80