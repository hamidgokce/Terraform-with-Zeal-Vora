## This snippet is from the Splat Expression Video.

### splat.tf

```sh

provider "aws" {
  region     = "us-west-2"
  access_key = "YOUR-ACCESS-KEY"
  secret_key = "YOUR-SECRET-KEY"
}
resource "aws_iam_user" "lb" {
  name = "iamuser.${count.index}"
  count = 3
  path = "/system/"
}

output "arns" {
  value = aws_iam_user.lb[*].arn
}
```
<!-- The terraform graph command is used to generate a visual representation of either a configuration or execution plan 

The output of terraform graph is in the DOT format, which can easily be converted to an image. -->
 