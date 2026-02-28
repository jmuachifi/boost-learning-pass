variable "bucket_name" {
  description = "Name of the s3 bucket. Must be unique."
  default     = null
  type        = string
}
variable "aws_region" {
  description = "AWS region to deploy resources in"
  default     = "us-east-2"
  type        = string
  
}