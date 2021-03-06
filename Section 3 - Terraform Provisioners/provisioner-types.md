### Important Note:

Make sure to have the ec2-key.pem file present in the working directory for the provisioner to be able to connect to the instance.

### Demo Code Used During Demo:


```sh
provider "aws" {
  region     = "ap-southeast-1"
  access_key = "YOUR-KEY"
  secret_key = "YOUR-KEY"
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

resource "aws_security_group" "allow_ssh" {
  name        = "allow_ssh"
  description = "Allow SSH inbound traffic"

  ingress {
    description = "SSH into VPC"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    description = "Outbound Allowed"
    from_port   = 0
    to_port     = 65535
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}


resource "aws_instance" "myec2" {
   ami = "ami-00ee4df451840fa9d"
   instance_type = "t2.micro"
   key_name = "ec2-key"
   vpc_security_group_ids  = [aws_security_group.allow_ssh.id]

   provisioner "remote-exec" {
     inline = [
       "sudo yum -y install nano"
     ]
   }
   provisioner "remote-exec" {
       when    = destroy
       inline = [
         "sudo yum -y remove nano"
       ]
     }
   connection {
     type = "ssh"
     user = "ec2-user"
     private_key = file("./ec2-key.pem")
     host = self.public_ip
   }
}
```
