variable "name" {
  type        = string
}

variable "environment" {
  type        = string
}

variable "key_pair_name" {
  type        = string
}

variable "public_key_path" {
  type        = string
}

variable "ec2_ami_id" {
  type        = string
}

variable "instance_type" {
  type        = string
}

variable "subnet_id" {
  type        = string
}

variable "security_group_ids" {
  type        = list(string)
}

variable "iam_instance_profile" {
  type        = string
}

variable "volume_size" {
  type        = number
}

variable "volume_type" {
  type        = string
  default     = "gp3"
}

variable "instance_name" {
  type        = string
}
