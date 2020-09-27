variable "aws_region" {
  default = "eu-west-1"
}
variable "vpc_id" {
  default = "vpc-1a2b3c4d"
}
variable "aws_subnets" {
  default = ["subnet-1a2b3c4d", "subnet-2a3b4c5d", "subnet-3a4b5c6d"]
}

variable "app_config" {
  default = {
    port     = 8080,
    base_url = "localhost:8080"
  }
}
