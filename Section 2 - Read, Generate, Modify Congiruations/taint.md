
### taint.tf
```sh
provider "aws" {
  region     = "us-west-2"
  access_key = "YOUR-ACCESS-KEY"
  secret_key = "YOUR-SECRET-KEY"
}

resource "aws_instance" "myec2" {
   ami = "ami-082b5a644766e0e6f"
   instance_type = "t2.micro"
}
```

### Taint Command
```sh
terraform taint aws_instance.myec2
```
<!-- 15.1 Understanding the Challenge:

You have created a new resource via Terraform.

Users have made a lot of manual changes (both infrastructure and inside the server)

Two ways to deal with this:  Import The Changes to Terraform / Delete & Recreate the resource


15.2 Overview of Terraform Taint

The terraform taint command manually marks a Terraform-managed resource as tainted, forcing it to be destroyed and recreated on the next apply.

15.3 Important Pointers for Terraform Taint

This command will not modify infrastructure but does modify the state file in order to mark a resource as tainted. 

Once a resource is marked as tainted, the next plan will show that the resource will be destroyed and recreated and the next apply will implement this change.

Note that tainting a resource for recreation may affect resources that depend on the newly tainted resource. -->
