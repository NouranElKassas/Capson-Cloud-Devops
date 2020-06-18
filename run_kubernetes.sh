#!/usr/bin/env bash

# This tags and uploads an image to Docker Hub

# Step 1:
# This is your Docker ID/path
# dockerpath=<>
dockerpath=/usr/bin/docker
docker run -d --restart=always -e DOMAIN=cluster --name capstone -p 80:80 capstone

# Step 2
# Run the Docker Hub container with kubernetes
kubectl run deployment --image=capstone --port=80

# Step 3:
# List kubernetes pods
kubectl get pod

#add domains to env
# add env to capstone
kubectl set env deployment/capstone DOMAIN=cluster

# Step 4:
# Forward the container port to a host
kubectl expose deployment capstone --type=LoadBalancer --port=80 --name=capstone-http
minikube service capstone
