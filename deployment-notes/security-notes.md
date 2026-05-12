# Security Notes

## Security Goal

The goal of this project is to expose the website publicly while keeping the EC2 web servers protected behind the Application Load Balancer.

## Public Access

Public users access the website through the Application Load Balancer.

The ALB security group allows:

- HTTP on port 80 from `0.0.0.0/0`
- HTTPS on port 443 from `0.0.0.0/0`

HTTP traffic is redirected to HTTPS.

## EC2 Access

The EC2 instances are not meant to be accessed directly by public users.

The EC2 security group allows:

- HTTP on port 80 from the ALB security group
- SSH on port 22 from My IP only

This keeps web traffic flowing through the Load Balancer and limits administrative access.

## SSH Security

SSH access is restricted to My IP instead of being open to the public internet.

This avoids exposing port 22 to everyone.

Bad practice avoided:

```text
SSH 22 from 0.0.0.0/0

