terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.5.0"
    }
  }
}

provider "aws" {
  # Configuration options
  region     = "us-west-2"
  access_key = "YOUR-KEY"
  secret_key = "YOUR-KEY"
}

resource "aws_instance" "myec2" {
   ami = "ami-082b5a644766e0e6f"
   instance_type = "t2.micro"

   provisioner "local-exec" {
    command = "echo ${aws_instance.myec2.private_ip} >> private_ips.txt"
  }
}


