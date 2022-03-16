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
  access_key = "PUT-YOUR-ACCESS-KEY-HERE"
  secret_key = "PUT-YOUR-SECRET-KEY-HERE"
}


resource "aws_eip" "elastic_ip" {
  vpc = true
}

output "elastic_ip" {
  value = aws_eip.elastic_ip.public_ip
}

resource "aws_s3_bucket" "mys3" {
  bucket = "hamid-attribute-demo-001"
}

output "mys3bucket" {
  value = aws_s3_bucket.mys3.bucket_domain_name
}
