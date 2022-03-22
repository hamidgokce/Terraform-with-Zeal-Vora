module "myec2_for_cloud" {
  source = "../../modules/cloud_ec2"
  instance_type = "t2.small"
}