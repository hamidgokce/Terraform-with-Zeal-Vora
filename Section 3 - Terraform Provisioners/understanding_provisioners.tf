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
   key_name = "hamid" # we create new key pair in the .tf folder
  #  vpc_security_group_ids  = [aws_security_group.allow_ssh.id]

   provisioner "remote-exec" {
     inline = [
       "sudo amazon-linux-extras install -y nginx1.12",
       "sudo systemctl start nginx"
     ]

   connection {
     type = "ssh"
     user = "ec2-user"
     private_key = file("./hamid.pem")
     host = self.public_ip
   }
   }
}