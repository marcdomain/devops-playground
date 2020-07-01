variable "aws_region" {
  default = "us-east-2"
}

variable "instance_type" {
  default = "t2.micro"
}

variable "ami" {
  default = "ami-0a63f96e85105c6d3"
}

variable "keyPath" {
  default = "awsKey.pem"
}

variable "instance_name" {
  default = "marc_app"
}
