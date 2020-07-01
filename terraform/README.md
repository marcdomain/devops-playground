# TERRAFORM & BASH FOR INFRASTRUCTURE AUTOMATION

In this project, Terraform is used to deploy infrastructure as code (IaC). It provisions an AWS EC2 instance and sets up a simple NodeJS-Express application. The bash script in this project directory clones the application from `https://github.com/marcdomain/basic-express-app.git`, and sets it up. It also configures NGINX for reverse proxy automation. The terraform file structure is designed to separate concerns.

## USAGE

- Terraform version: v0.11.11
- Create an env_variables.tf file which should contain your AWS credentials
- Place your pem file in the terraform directory or any other location, but ensure to reference the path correctly in line 14 of variable.tf
- Initialise the terraform script

```bash
  $ terraform init
```

- Run terraform plan to see the resources that are to be created

```bash
  $ terraform plan
```

- Provision EC2 instance

```bash
  $ terraform apply -auto-approve
```

- Copy and paste the public IP from your CLI and use it to view the app in browser. Or go to AWS console and copy the public IP of the EC2 instance

- Destroy the infrastructure

```bash
  $ terraform destroy -auto-approve
```
