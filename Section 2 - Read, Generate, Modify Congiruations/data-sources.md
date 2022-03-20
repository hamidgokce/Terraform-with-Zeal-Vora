## This snippet is from the Data Sources video.

### data-source.tf

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

data "aws_ami" "app_ami" {
  most_recent = true
  owners = ["amazon"]


  filter {
    name   = "name"
    values = ["amzn2-ami-hvm*"]
  }
}

resource "aws_instance" "instance-1" {
    ami = data.aws_ami.app_ami.id
   instance_type = "t2.micro"
}
```
<!-- https://www.terraform.io/language/data-sources

data "aws_ami" "example" {
  most_recent = true

  owners = ["self"]
  tags = {
    Name   = "app-server"
    Tested = "true"
  }
} -->
