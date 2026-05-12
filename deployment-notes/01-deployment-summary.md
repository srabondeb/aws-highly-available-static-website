# Deployment Summary

## Project
Highly Available Static Website on AWS

## Domain
https://debnath.click

## What I Built
I deployed a static portfolio website on AWS using a highly available architecture.

The website runs on EC2 instances with Apache. The instances are managed by an Auto Scaling Group and registered with a Target Group. An Application Load Balancer distributes traffic across healthy instances. Route 53 points the custom domain to the Load Balancer, and AWS Certificate Manager provides HTTPS.

## Main Steps Completed

1. Built and tested the static website locally.
2. Pushed the website files to GitHub.
3. Created a Launch Template with User Data.
4. Used User Data to install Apache and Git.
5. Used User Data to clone the GitHub repository.
6. Copied the website files into `/var/www/html`.
7. Created a Target Group with health checks.
8. Created an Application Load Balancer.
9. Created an Auto Scaling Group with two EC2 instances.
10. Confirmed both targets became healthy.
11. Connected `debnath.click` using Route 53.
12. Requested and validated an ACM certificate.
13. Added HTTPS to the Load Balancer.
14. Created a CloudWatch CPU alarm.

## Result
The website is accessible through:

- `https://debnath.click`
- `https://www.debnath.click`

The infrastructure supports load balancing, automatic instance replacement, HTTPS, custom domain routing, and basic monitoring.
