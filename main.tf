# main.tf

# Configure the AWS provider
provider "aws" {
  region = "eu-north-1" # Specify your desired AWS region
}

# Define a variable for the S3 bucket name
variable "bucket_name" {
  description = "ankita_bucket"
  type        = string
  default     = "my-unique-hcp-terraform-s3-bucket-example" # Ensure this name is globally unique
}

# Create the S3 bucket resource
resource "aws_s3_bucket" "example_bucket_ankita" {
  bucket = var.bucket_name

  tags = {
    Environment = "HCPTerraform"
    Project     = "S3BucketExample"
  }
}

# Enable versioning for the S3 bucket
resource "aws_s3_bucket_versioning" "example_bucket_versioning" {
  bucket = aws_s3_bucket.example_bucket.id
  versioning_configuration {
    status = "Enabled"
  }
}

# Set the access control list (ACL) for the S3 bucket to private
resource "aws_s3_bucket_acl" "example_bucket_acl" {
  bucket = aws_s3_bucket.example_bucket.id
  acl    = "private"
}

# Output the S3 bucket name and ARN
output "s3_bucket_name" {
  description = "The name of the created S3 bucket."
  value       = aws_s3_bucket.example_bucket.bucket
}

output "s3_bucket_arn" {
  description = "The ARN of the created S3 bucket."
  value       = aws_s3_bucket.example_bucket.arn
}