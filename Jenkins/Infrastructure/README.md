# Jenkins Infrastructure Security, Network and Instance
This repository provides the Cloudformation scripts to quickly depoly an aws Jenkins test server. This environment is based off of the "Cloud DevOps Nanodegree - C3 - Build CI/CD Piplines, Monitoring, and Logging" course at Udacity
- **Policy-groups** - is a YAML file the will create a IAM polcy restricting access to EC2, S3, and Cloud Watch, and a Group called *Jenkins* which will be assigned this policy
- **Launch-Instance** - will create an EC2 Instance with Jenkins depolyed. The deployment  script used can be found in `install-jenkins.sh`
## Dependencies
**1. AWS account**
You are required to have an AWS account to build this infrastructure. As of right now you will have to manually create a user and assign it to the *Jenkins* group

**2. Jenkins on Ubuntu VM**
As of right now there are no additional plugins installed for Jenkins. When more are needed for this course they will be added
