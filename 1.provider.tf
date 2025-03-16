provider "aws" {
  region = var.aws_region
}

terraform {
  required_version = "<= 1.11.1" #Forcing which version of Terraform needs to be used
  required_providers {
    aws = {
      version = "<= 6.0.0" #Forcing which version of plugin needs to be used.
      source  = "hashicorp/aws"
    }
  }
  backend "s3" {
    bucket = "ansible-workspacesbucket01"
    key    = "Ansible.tfstate"
    region = "eu-west-2"
    # dynamodb_table = "-terraform-locks"
    encrypt = true
  }
}
