terraform {
  backend "s3" {
bucket = "hamid-remote-backend" # bucket name we created earlier
key = "remotedemo.tfstate"
region = "us-east-1"
   access_key = ""
  secret_key = ""    
  }
}