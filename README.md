# 🚀 DevOps Capstone Project: Automated Cloud Deployment with Terraform, Docker & Kubernetes
## Overview

This project demonstrates a full DevOps workflow for deploying a containerised web application to AWS using Infrastructure as Code, CI/CD, and Kubernetes orchestration.  

The goal was to automate:  

Cloud infrastructure provisioning  

Application containerisation  

Continuous delivery to a Kubernetes cluster  

All components are designed to reflect real-world DevOps practices, not toy examples.  

## 🏗️ Architecture

Workflow:  

Terraform provisions AWS infrastructure:  

EC2 instance  

Security Group  

Networking (default VPC)  

Docker containerises a static web application  

K3s (lightweight Kubernetes) runs on the EC2 instance  

GitHub Actions:  

Builds and pushes the Docker image  

Deploys the application to Kubernetes via SSH  

GitHub → GitHub Actions → Docker Hub → AWS EC2 (K3s) → Kubernetes Pods → Public Service  

## 📂 Project Structure
```
$ tree
capstone-project/
├── app/
│   ├── Dockerfile
│   └── index.html
├── k8s/
│   ├── deployment.yaml
│   └── service.yaml
├── scripts/
│   └── install_k3s.sh
├── terraform/
│   ├── main.tf
│   ├── variables.tf
│   ├── outputs.tf
│   └── terraform.tfvars
└── README.md
 ```  
## ⚙️ Infrastructure (Terraform)

Terraform is used to provision:  

- An EC2 instance (t3.small) to run Kubernetes   

- A Security Group allowing:  

    - SSH (22)  

    - HTTP (80)  

    - Kubernetes NodePort traffic  

Key Terraform concepts demonstrated:    

- Providers

- Variables

- Outputs

- State management

- Resource importing

## 🐳 Containerisation (Docker)

The application is packaged as a Docker image using Nginx:

- Lightweight

- Stateless

- Production-ready container

The image is pushed to Docker Hub via GitHub Actions using encrypted GitHub Secrets.

## ☸️ Kubernetes (K3s)

The application is deployed to Kubernetes using:

- Deployment for pod management

- Service (NodePort) for external access

K3s was chosen to simulate a real Kubernetes environment on limited cloud resources.

## 🔁 CI/CD Pipeline (GitHub Actions)

On every push to main:

1. Docker image is built

2. Image is pushed to Docker Hub

3. Terraform provisions / updates infrastructure

4. Application is deployed to Kubernetes via SSH

This mirrors how many small-to-mid production systems operate and I am happy I succeeded.

## How to Access App

1. Get the Public IPv4 from EC2 on AWS
2. Enter http://<EC2_PUBLIC_IP>:30080 in a browser.

## 🧠 Key Learnings

- Kubernetes requires sufficient resources (1GB RAM is not enough) so moved from t3.micro to t3.small  

- Terraform state management is critical in real environments  

- CI/CD pipelines must handle infrastructure and application deployment  

- Automation doesn’t remove responsibility — it shifts it left  

## 🔮 Improvements / Next Steps

- Use an Application Load Balancer

- Replace SSH with GitHub OIDC

- Add Ingress + TLS

- Move to EKS

- 
Add monitoring (Prometheus / Grafana)
