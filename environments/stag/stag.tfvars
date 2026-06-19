aws_region  = "us-east-1"
name        = "us-app"
environment = "stag"
owner       = "platform-team"

vpc_cidr            = "10.1.0.0/16"
public_subnet_cidr  = "10.1.1.0/24"
private_subnet_cidr = "10.1.11.0/24"
availability_zone   = "us-east-1b"

sg_ingress_rules = [
  {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["10.0.0.0/8"]
    description = "SSH from internal only"
  },
  {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    description = "HTTP access"
  },
  {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    description = "HTTPS access"
  }
]

key_pair_name   = "us-app-stag-key"
public_key_path = "ec2-key.pub"
instance_name   = "us-app-stag-server"
ec2_ami_id      = "ami-0c02fb55956c7d316"
instance_type   = "t3.small"
volume_size     = 30
volume_type     = "gp3"

iam_role_name  = "us-app-stag-ec2-role"
iam_policy_arn = "arn:aws:iam::aws:policy/AmazonS3ReadOnlyAccess"

s3_bucket_name        = "us-app-stag-assets-bucket"
s3_versioning_enabled = "Enabled"
