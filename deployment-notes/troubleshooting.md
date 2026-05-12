# Troubleshooting Notes

## Issue 1: User Data Could Not Clone GitHub Repository

### Problem

During the first EC2 User Data test, Apache installed successfully, but the website did not deploy.

The public IP showed the default Red Hat/Apache page instead of my portfolio website.

### Investigation

I checked the cloud-init output log:


`fatal: could not read Username for 'https://github.com': No such device or address`
Cause: The git repo was private and I easily fixed it changing it back to public; And I also updated the inbound roles in the security group; I added HTTP and HTTPS in there;

sudo cat /var/log/cloud-init-output.log
