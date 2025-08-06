provider "aws" {
    region = "eu-north-1"
}

resource "aws_s3_bucket" "my_bucket" {
    bucket = "ankita-s3-bucket-name-123458"
}