## This snippet is from the Terraform Function video.

### functions.tf

```sh
provider "aws" {
  region     = var.region
  access_key = "YOUR-ACCESS-KEY"
  secret_key = "YOUR-SECRET-KEY"
}
# terraform {
#   required_providers {
#     aws = {
#       source  = "hashicorp/aws"
#       version = "4.5.0"
#     }
#   }
# }

# provider "aws" {
#   # Configuration options
#   region     = "us-west-2"
#  access_key = "PUT-YOUR-ACCESS-KEY-HERE "
#   secret_key = "PUT-YOUR-SECRET-KEY-HERE "
# }
locals {
  time = formatdate("DD MMM YYYY hh:mm ZZZ", timestamp())
}

variable "region" {
  default = "ap-south-1"
}

variable "tags" {
  type = list
  default = ["firstec2","secondec2"]
}

variable "ami" {
  type = map
  default = {
    "us-east-1" = "ami-0323c3dd2da7fb37d"
    "us-west-2" = "ami-0d6621c01e8c2de2c"
    "ap-south-1" = "ami-0470e33cd681b2476"
  }
}

resource "aws_key_pair" "loginkey" {
  key_name   = "login-key"
  public_key = file("${path.module}/EC2_key.pub") # We need to write EC2 key-pair as a .pub file
  # public_key = file("${path.module}/id_rsa.pub") # command in the original file. I got an invalid KEY error while running 

}

# Commands
# - Terraform console 
# - file("${path.module}/EC2_key.pub")

resource "aws_instance" "app-dev" {
   ami = lookup(var.ami,var.region)
   instance_type = "t2.micro"
   key_name = aws_key_pair.loginkey.key_name
   count = 2

   tags = {
     Name = element(var.tags,count.index)
   }
}


output "timestamp" {
  value = local.time
}
```
### The id_rsa.pub file that we have used within the video
```sh
https://www.terraform.io/language/functions
https://github.com/zealvora/terraform-beginner-to-advanced-resource/blob/master/section04/id_rsa.pub
```
