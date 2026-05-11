# Highly Available Static Website on AWS

## Project Overview

This project deploys a static portfolio website on AWS using a highly available and load-balanced architecture.

The website is hosted on EC2 instances running Apache. An Application Load Balancer distributes traffic across healthy instances managed by an Auto Scaling Group. Route 53 connects the custom domain `debnath.click` to the Load Balancer, and AWS Certificate Manager enables HTTPS.

The goal of this project is to demonstrate practical cloud infrastructure skills for entry-level cloud engineering, cloud support, and cloud operations roles.

## Live Website

- Domain: `https://debnath.click`
- GitHub Repository: `https://github.com/srabondeb/aws-highly-available-static-website`

## Architecture Summary

Traffic flow:

1. User visits `https://debnath.click`.
2. Route 53 resolves the domain.
3. The request goes to the Application Load Balancer.
4. The ALB uses an ACM certificate for HTTPS.
5. The ALB forwards traffic to healthy EC2 instances in the Target Group.
6. EC2 instances serve the static website using Apache.
7. CloudWatch monitors the infrastructure.

## AWS Services Used

- Amazon EC2
- Apache HTTP Server
- Application Load Balancer
- Target Group
- Auto Scaling Group
- Route 53
- AWS Certificate Manager
- CloudWatch
- Security Groups
- User Data
- GitHub

## Key Features

- Static website deployed on EC2
- Automated EC2 setup using User Data
- Website files pulled from GitHub during instance launch
- Load balancing across multiple EC2 instances
- Auto Scaling Group maintains desired instance capacity
- Custom domain connected using Route 53
- HTTPS enabled using AWS Certificate Manager
- CloudWatch alarm created for CPU monitoring
- Security group rules configured for ALB and EC2 access

## Security Configuration

- Public users access the website through the Application Load Balancer.
- HTTPS is enabled with an ACM certificate.
- EC2 instances allow HTTP traffic from the ALB security group.
- SSH access is restricted to My IP.
- No private keys, AWS credentials, or sensitive files are stored in GitHub.

## Folder Structure

```text
aws-highly-available-static-website/
├── README.md
├── website/
│   ├── index.html
│   ├── style.css
│   ├── mediaqueries.css
│   ├── script.js
│   └── assets/
├── user-data/
│   └── apache-user-data.sh
├── architecture/
│   ├── architecture-diagram.png
│   └── architecture-notes.md
├── deployment-notes/
├── screenshots/
└── linkedin-post/
