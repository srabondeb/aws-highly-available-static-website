# Project: Highly Available Static Website on AWS
## Overview
The goal of this project was to host my personal portfolio, “debnath.click”, on a highly available AWS infrastructure. 
Instead of deploying the website on a single server, I built a load-balanced and auto-scaling environment using EC2, Apache, an Application Load Balancer, Auto Scaling Group, Route 53, ACM, and CloudWatch.
The main purpose of this project was to practice real cloud infrastructure deployment, with improve reliability and secure traffic with HTTPS. I also documented the setup in a way that reflects entry-level cloud engineering work.

## Architecture: This project uses a highly available AWS architecture to serve a static portfolio website through a secure, load-balanced setup.

### DNS and HTTPS: The domain “debnath.click” is managed through Amazon Route 53. Then The route 53 directs users to the Application Load Balancer. I also used AWS Certificate Manager to provide the SSL/TLS certificate for the domain, which allowed the website to load securely over HTTPS.

### Application Load Balancer: The Application Load Balancer is the public entry point for the website. Instead of sending users directly to one EC2 instance, the Application Load Balancer distributes incoming traffic across healthy web servers in the Target Group. This helps improve availability and prevents the website from depending on a single server.

### Auto Scaling Group and EC2: The website is hosted on EC2 instances running Apache.
Then An Auto Scaling Group manages these instances and keeps the desired number of servers running. If an instance becomes unhealthy, the Auto Scaling Group can replace it with a new one. This makes the setup more resilient than hosting the website on a single EC2 instance.

### User Data Automation: Each EC2 instance uses a User Data script during launch.
The script automatically:
- Installs Apache
- Installs Git
- Clones the GitHub repository
- Copies the website files into `/var/www/html`
- Starts and enables the Apache web server

This allows new instances to configure themselves automatically without manual setup.

## Traffic Flow : When a user visit “https://debnath.click”, the request follows this path:
1. Route 53 resolves the domain.
2. The request is sent to the Application Load Balancer.
3. The ALB handles HTTPS using the ACM certificate.
4. The ALB checks the Target Group for healthy EC2 instances.
5. A healthy EC2 instance serves the website through Apache.
6. CloudWatch monitors metrics such as CPU utilization and load balancer activity.

## Reliability
The website is designed to be more resilient than a single-server deployment because of auto scaling group. If one EC2 instance becomes unhealthy, the Auto Scaling Group can replace it with a new instance. The Load Balancer only sends traffic to healthy targets.
This improves availability and reduces the risk of downtime from a single instance failure.

## Security : This project uses a layered security approach.
- Public users access the website through the Application Load Balancer.
- HTTPS is enabled using AWS Certificate Manager.
- EC2 instances allow HTTP traffic from the Load Balancer security group.
- SSH access is restricted to my own IP address.
- No private keys, AWS credentials, or sensitive files are stored in the GitHub repository.

## Monitoring : I used CloudWatch to monitor the infrastructure.
A CloudWatch CPU alarm was created to track high CPU utilization across the Auto Scaling Group. Load Balancer metrics can also be used to monitor request count, target response time, healthy host count, and unhealthy host count.

