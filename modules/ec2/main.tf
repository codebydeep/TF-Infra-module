resource "aws_key_pair" "this" {
  key_name   = var.key_pair_name
  public_key = file(var.public_key_path)

  tags = {
    Name = var.key_pair_name
  }
}

resource "aws_instance" "this" {
  ami                    = var.ec2_ami_id
  instance_type          = var.instance_type
  subnet_id              = var.subnet_id
  vpc_security_group_ids = var.security_group_ids
  key_name               = aws_key_pair.this.key_name
  iam_instance_profile   = var.iam_instance_profile

  root_block_device {
    volume_size           = var.volume_size
    volume_type           = var.volume_type
    encrypted             = true
    delete_on_termination = true
  }

  tags = {
    Name = var.instance_name
  }
}

locals {
  name_prefix = "${var.name}-${var.environment}"
}