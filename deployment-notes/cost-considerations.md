# Cost Considerations

## Cost Awareness

This project uses several AWS services that can create ongoing charges if left running.

The main goal is to build and document the infrastructure while avoiding unnecessary long-term costs.

## Main Cost Sources

### EC2 Instances

The Auto Scaling Group runs EC2 instances for the website.

Current setup:

- Desired capacity: 2
- Minimum capacity: 1
- Maximum capacity: 3

Running multiple instances improves availability, but it can increase cost if left active all the time.

### Application Load Balancer

The Application Load Balancer has an hourly cost.

This is one of the main costs in the project because it continues billing while the Load Balancer exists.

### Route 53

Route 53 charges for hosted zones and DNS queries.

The hosted zone for `debnath.click` has a small monthly cost.

### CloudWatch

CloudWatch may charge for alarms, metrics, and logs depending on usage.

This project uses CloudWatch for basic monitoring and a CPU alarm.

## Cost Control Steps

To reduce cost when the project is not being tested, I can:

1. Set the Auto Scaling Group desired capacity to `0`.
2. Set minimum capacity to `0`.
3. Delete unused EC2 instances.
4. Delete the Application Load Balancer if the live demo is not needed.
5. Remove unused Target Groups.
6. Delete unused CloudWatch alarms.
7. Monitor AWS Billing and Cost Management.

## When to Keep the Project Running

The project can be kept live when:

- Testing the deployment
- Recording a demo
- Sharing the project on LinkedIn
- Applying for jobs
- Preparing for interviews

When the project is not actively needed, expensive resources should be reduced or removed.

## Cost Summary

This project demonstrates cloud infrastructure while also requiring cost awareness.

A cloud engineer should not only know how to deploy resources, but also how to monitor and control the cost of those resources.
