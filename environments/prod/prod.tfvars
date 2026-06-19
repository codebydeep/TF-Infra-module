aws_region  = "us-east-1"
name        = "us-app"
environment = "prod"
owner       = "platform-team"

vpc_cidr            = "10.2.0.0/16"
public_subnet_cidr  = "10.2.1.0/24"
private_subnet_cidr = "10.2.11.0/24"
availability_zone   = "us-east-1c"

sg_ingress_rules = [
  {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["10.0.0.0/8"]
    description = "SSH from internal only"
  },
  {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    description = "HTTPS access"
  }
]

key_pair_name   = "us-app-prod-key"
public_key_path = "ec2-key.pub"
instance_name   = "us-app-prod-server"
ec2_ami_id      = "ami-0c02fb55956c7d316"
instance_type   = "t3.medium"
volume_size     = 50
volume_type     = "gp3"

iam_role_name  = "us-app-prod-ec2-role"
iam_policy_arn = "arn:aws:iam::aws:policy/AmazonS3ReadOnlyAccess"

s3_bucket_name        = "us-app-prod-assets-bucket"
s3_versioning_enabled = "Enabled"
