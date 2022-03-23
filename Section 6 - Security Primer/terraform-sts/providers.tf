provider "aws" {
  region = "us-east-1"
  assume_role {
    role_arn = "arn:aws:iam::00066762922:user/hamidgokce"
    session_name = "hamid_demo"
  }
}