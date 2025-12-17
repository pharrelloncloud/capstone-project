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

```capstone-project/
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
└── README.md ```   

## ⚙️ Infrastructure (Terraform)

Terraform is used to provision:  

An EC2 instance (t3.small) to run Kubernetes   

A Security Group allowing:  

SSH (22)  

HTTP (80)  

Kubernetes NodePort traffic  

Key Terraform concepts demonstrated:  

- Providers

Variables

Outputs

State management

Resource importing
