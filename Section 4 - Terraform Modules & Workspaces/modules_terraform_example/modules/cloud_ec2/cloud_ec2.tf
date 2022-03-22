
# resource "aws_instance" "myec2_for_cloud" {
#    ami = "ami-082b5a644766e0e6f"
#    instance_type = "t2.small"
# }

resource "aws_instance" "myec2_for_cloud" {
  ami           = "ami-082b5a644766e0e6f"
  instance_type = var.instance_type
}