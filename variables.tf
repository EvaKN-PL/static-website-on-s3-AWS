variable "aws_region" {
    description = "AWS Region"
    type = string
    default = "eu-central-1"
}

variable "bucket_name" {
    description = "Name of S3 bucket"
    type = string
    default = "NAME_YOUR_BUCKET"
  
}

variable "domain_name" {
    description = "Name of domain"
    type = string
}

variable "hosted_zone_id" {
    description = "ID of zone Route 53"
    type = string
  
}

