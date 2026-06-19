variable "aws_region" {
  description = "AWS region to deploy resources into"
  type        = string
  default     = "us-east-1"
}

variable "name" {
  description = "Project name"
  type        = string
}

variable "environment" {
  description = "Deployment environment (dev | stag | prod)"
  type        = string
  default     = "dev"
}

variable "owner" {
  description = "Team or individual responsible for these resources"
  type        = string
}

variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  type        = string
}

variable "public_subnet_cidr" {
  description = "CIDR block for the public subnet"
  type        = string
}

variable "private_subnet_cidr" {
  description = "CIDR block for the private subnet"
  type        = string
}

variable "availability_zone" {
  description = "Availability zone for the subnets"
  type        = string
}

variable "sg_ingress_rules" {
  description = "Ingress rules for the EC2 security group"
  type = list(object({
    from_port   = number
    to_port     = number
    protocol    = string
    cidr_blocks = list(string)
    description = string
  }))
}

variable "key_pair_name" {
  description = "Name to assign to the AWS key pair"
  type        = string
}

variable "public_key_path" {
  description = "Local path to the public key file"
  type        = string
}

variable "instance_name" {
  description = "Name tag for the EC2 instance"
  type        = string
}

variable "ec2_ami_id" {
  description = "AMI ID for the EC2 instance"
  type        = string
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
}

variable "volume_size" {
  description = "Root EBS volume size in GB"
  type        = number
}

variable "volume_type" {
  description = "Root EBS volume type"
  type        = string
  default     = "gp3"
}

variable "iam_role_name" {
  description = "Name of the IAM role for EC2"
  type        = string
}

variable "iam_policy_arn" {
  description = "Managed policy ARN to attach to the EC2 role"
  type        = string
}

variable "s3_bucket_name" {
  description = "Globally unique S3 bucket name"
  type        = string
}

variable "s3_versioning_enabled" {
  description = "Versioning status for S3: Enabled or Suspended"
  type        = string
  default     = "Enabled"
}
