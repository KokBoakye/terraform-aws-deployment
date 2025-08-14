Terraform AWS Deployment
Overview
This repository contains Terraform code and application artifacts to deploy a production-ready infrastructure on AWS. The deployment includes:
Application Load Balancer (ALB)
NGINX reverse proxy
Flask application servers served via Gunicorn
RDS PostgreSQL database
The infrastructure is fully modular and uses Terraform best practices with remote state management.
Repository Structure
terraform-aws-deployment/
├── App/
│   └── flask_app/
│       ├── Dockerfile
│       ├── app.py
│       ├── nginx/
│       │   ├── Dockerfile
│       │   └── nginx.conf
│       ├── requirements.txt
│       └── templates/
│           └── users.html
├── backend.tf
├── dev.tfvars
├── docker-compose.yml
├── main.tf
├── outputs.tf
├── prod.tfvars
├── provider.tf
└── variables.tf
Description of Key Folders/Files
App/flask_app/: Contains the Flask application, Dockerfiles for the app and NGINX, and HTML templates.
backend.tf: Configures the remote S3 backend with DynamoDB state locking.
main.tf: Defines the main infrastructure resources including ALB, EC2 instances, and RDS.
provider.tf: AWS provider configuration.
variables.tf: Variable definitions for environment-specific customization.
dev.tfvars / prod.tfvars: Environment-specific variables.
outputs.tf: Defines Terraform outputs such as ALB DNS and RDS endpoint.
docker-compose.yml: Local development setup for testing the Flask + NGINX stack.
Architecture
           +--------------------+
           |    ALB (HTTPS)     |
           +---------+----------+
                     |
          +----------+----------+
          |                     |
      NGINX Load Balancer   NGINX Load Balancer
          |                     |
+---------+---------+   +-------+---------+
| Application Server |   | Application Server |
|   (Flask + Gunicorn)|  |   (Flask + Gunicorn)|
+---------+---------+   +-------+---------+
          |
          |
     RDS PostgreSQL



Deployment Steps
Clone the repository
git clone https://github.com/KokBoakye/terraform-aws-deployment.git
cd terraform-aws-deployment
Initialize Terraform
terraform init
Select environment
terraform workspace new dev  # or use 'prod'
terraform workspace select dev
Plan and apply infrastructure
terraform plan -var-file="dev.tfvars"
terraform apply -var-file="dev.tfvars"
Access your application
Use the ALB DNS name output from Terraform to access the Flask application.


Security & Best Practices
All security groups follow the least-privilege principle
RDS instances are encrypted at rest
EC2 instances run with minimal IAM permissions
Terraform code is formatted and validated automatically


Requirements
Terraform >= 1.5.0
AWS CLI configured
Docker for local testing (optional)



Authors
Kwabena Okyere Boakye
