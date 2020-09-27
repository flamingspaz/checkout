provider "aws" {
  region = var.aws_region
}

data "aws_vpc" "main" {
  id = var.vpc_id
}


### An example of remote state storage
### Not implemented in this example as it's added complexity
# variable "tf-sync-bucket" {}
#
# terraform {
#     backend "s3" {
#         bucket = "syncbucket"
#         key    = "network/terraform.tfstate"
#         region = "eu-west-1"
#     }
# }
#
# resource "aws_s3_bucket" "syncbucket" {
#     bucket          = "syncbuket"
#     acl             = "private"
#     versioning {
#         enabled     = true
#     }
#     tags {
#         Name        = "syncbucket"
#         Environment = "shared"
#     }
# }
