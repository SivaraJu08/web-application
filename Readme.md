# Cloud & DevOps Engineer Assessment Task

## Overview
This project deploys a static web application on GCP Kubernetes Engine (GKE) with Prometheus for monitoring.

## Requirements
- GCP Account with billing enabled
- Terraform, Docker, kubectl, Helm installed locally

## Steps to Deploy
1. Clone the repository and configure your GCP project ID in main.tf.
2. Run the following commands to provision the infrastructure:
   
   terraform init
   terraform apply
-----

#Build and push the Docker image:

docker build -t gcr.io/project-id/static-web-app:v1 .
docker push gcr.io/project-id/static-web-app:v1
------


#Deploy the Kubernetes application:

kubectl apply -f deployment.yaml
kubectl apply -f service.yaml
------

#Set up Prometheus for monitoring:

helm install prometheus prometheus-community/prometheus
-------

#Access the Application-----

Access the application via the external IP of the service:
kubectl get service static-web-app-service
Access Prometheus:
kubectl port-forward service/prometheus-server 9090:80


---

### *3. Deliverables*
- *IaC Template*: main.tf
- *Kubernetes Deployment Files*: deployment.yaml, service.yaml
- *Monitoring Config*: Prometheus Helm deployment
- *Dockerfile*: For containerization
