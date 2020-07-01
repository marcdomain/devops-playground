# CLOUDFORMATION & BASH FOR INFRASTRUCTURE AUTOMATION

In this project, Cloudformation is used to deploy an infrastructure as code (IaC). It provisions an AWS EC2 instance and sets up a simple NodeJS-Express application. The bash script in this project directory clones the application from `https://github.com/marcdomain/basic-express-app.git`, and sets it up. It also configures NGINX for reverse proxy automation. The terraform file structure is designed to separate concerns.

## USAGE

- Login to your AWS account via AWS CLI, using `aws configure` and follow the prompts.

- Create stack using the Cloudformation template in EC2.yml file. This will provision the EC2 instance and use the bash scripts in the EC2.yml file to setup and start the sever.

```bash
  $ bash create.sh
```

- Go to AWS console, in the region used for the provisioning, and copy the public IP of the EC2 instance. Paste the IP address in your browser to view the app running on the provisioned instance.

- Delete the created stack

```bash
  $ bash delete.sh
```
