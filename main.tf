#create s3 bucket with s3-appname-env DRY###
variable "app_name" {
  description = "Application Name"
  type = string
}

variable "env_name" {
  description = "for which env"
  type = string
}

#normal usage
# resource "aws_s3_bucket" "s3b" {
#   bucket = "s3-${var.app_name}-${var.env_name}"
#   tags = {
#     Name = "s3-${var.app_name}-${var.env_name}-bucket"
#     Environment = var.env_name
#   }
# }

locals {
  bucket-name = "s3-${var.app_name}-${var.env_name}"
  ec2-name = "test"
}


resource "aws_s3_bucket" "Mys3" {
  bucket = "s3kumars-app-${count.index}"
 count = 3
  tags = {
    Name = local.bucket-name
    Environment = var.env_name
  }
}