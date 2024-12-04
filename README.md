# serverless-webapp-aws-terraform
Use Terraform or AWS CloudFormation to automate the deployment of Lambda functions, API Gateway endpoints, and DynamoDB tables.

# Dir structure (+ user creation script)

project/

├── main.tf

├── variables.tf

├── lambda_function.py

├── lambda.zip

└── terraform.tfvars


# No S3 buckets involved
This configuration removes the dependency on S3 and directly references the local deployment package, simplifying the setup and deployment process.

# User creation script
create_users.sh

# usage
1. update terraform.tfvars, user creation script for variables as needed
2. run the config terraform init, validate, plan, apply
3. Enjoy
