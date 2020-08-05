# HA-WebApp
# Description
Project deployment for UDACITY DevOps Class via AWS
## Scenario 
Your company is creating an Instagram clone called Udagram. Developers pushed the latest version of their code in a zip file located in a public S3 Bucket.
You have been tasked with deploying the application, along with the necessary supporting software into its matching infrastructure.
This needs to be done in an automated fashion so that the infrastructure can be discarded as soon as the testing team finishes their tests and gathers their results.
You'll need to create a Launch Configuration for your application servers in order to deploy four servers, two located in each of your private subnets. The launch configuration will be used by an auto-scaling group.
You'll need two vCPUs and at least 4GB of RAM. The Operating System to be used is **Ubuntu 18**. So, choose an Instance size and Machine Image (AMI) that best fits this spec. Be sure to allocate at least 10GB of disk space so that you don't run into issues
### Security Groups and Roles
Since you will be downloading the application archive from an S3 Bucket, you'll need to create an IAM Role that allows your instances to use the S3 Service.
Udagram communicates on the default HTTP Port: 80, so your servers will need this inbound port open since you will use it with the Load Balancer and the Load Balancer Health Check. As for outbound, the servers will need unrestricted internet access to be able to download and update its software.
The load balancer should allow all public traffic (0.0.0.0/0) on port 80 inbound, which is the default HTTP port. Outbound, it will only be using port 80 to reach the internal servers.
The application needs to be deployed into private subnets with a Load Balancer located in a public subnet.
One of the output exports of the CloudFormation script should be the public URL of the LoadBalancer.
Log information for UserData scripts is located in this file: cloud-init-output.log under the folder: /var/log.
You should be able to destroy the entire infrastructure and build it back up without any manual steps required, other than running the CloudFormation script.
It's up to you to decide which values should be parameters and which you will hard-code in your script.
### Tips
- You can deploy your servers with an SSH Key into Public subnets while you are creating the script. This helps with troubleshooting. Once done, move them to your private subnets and remove the SSH Key from your Launch Configuration.
- It also helps to test directly, without the load balancer. Once you are confident that your server is behaving correctly, increase the instance count and add the load balancer to your script.
- While your instances are in public subnets, you'll also need the SSH port open (port 22) for your access, in case you need to troubleshoot your instances.
- The provided UserData script should help you install all the required dependencies. Bear in mind that this process takes several minutes to complete. Also, the application takes a few seconds to load. This information is crucial for the settings of your load balancer health check.
- If you want to go the extra mile, set up a bastion host to allow you to SSH into your private subnet servers. This bastion host would be on a Public Subnet with port 22 open only to your home IP address, and it would need to have the private key that you use to access the other servers.
### Bonus
Bonus points if you add http:// in front of the load balancer DNS Name in the output, for convenience.

## Notes
1. Scripts must be ran with the `--capabilities "CAPABILITY_IAM" "CAPABILITY_NAMED_IAM"` options
2. Parameters file `Launch-Parameter.json` contains the following named parameters as an example
    - EnvironmentName
        - **Description:** *An environment name that will be prefixed to resource names*
    - VpcCIDR
        - **Description:** *The IP range (CIDR notation) for the VPC*
    - PrivatePrimaryCIDR
        - **Description:** *The IP range (CIDR notation) for the private subnet in the first Availability Zone*
    - PrivateFailoverCIDR
        - **Description:** *The IP range (CIDR notation) for the private subnet in the second Availability Zone*
    - PublicSubnet1CIDR
        - **Description:** *The IP range (CIDR notation) for the public subnet in the first Availability Zone*
    - PublicSubnet2CIDR
        - **Description:** *The IP range (CIDR notation) for the public subnet in the second Availability Zone*
    - InternetCIDR
        - **Description:** *The CIRD notation for the internet*
    - EC2KeyName
        - **Description:** *The name of the EC2 Key pair*
    - EC2InstanceType
        - **Description:** *The instance type of the EC2 instance, type list available in the Amazon EC2 User Guide for Linux Instances*
    - AmazonAMI
        - **Description:** *The unique ID of the Amazon Machine Image. Defaults to Free Amazon Linux Server*
3. The Only output for this stack is the LoadBalancer URL `!Sub ${EnvironmentName}-URL` which is dependent on the EnvironmentName. The default output value is `Test-URL`