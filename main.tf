module "vpc" {
  source = "./modules/vpc"

  name                = var.name
  environment         = var.environment
  vpc_cidr            = var.vpc_cidr
  public_subnet_cidr  = var.public_subnet_cidr
  private_subnet_cidr = var.private_subnet_cidr
  availability_zone   = var.availability_zone
}

module "sg" {
  source = "./modules/sg"

  name          = var.name
  environment   = var.environment
  vpc_id        = module.vpc.vpc_id
  ingress_rules = var.sg_ingress_rules
}

module "iam" {
  source = "./modules/iam"

  name          = var.name
  environment   = var.environment
  iam_role_name = var.iam_role_name
  policy_arn    = var.iam_policy_arn
}

module "s3" {
  source             = "./modules/s3"
  bucket_name        = var.s3_bucket_name
  versioning_enabled = var.s3_versioning_enabled
}

module "ec2" {
  source = "./modules/ec2"

  name                 = var.name
  environment          = var.environment
  key_pair_name        = var.key_pair_name
  public_key_path      = var.public_key_path
  instance_name        = var.instance_name
  ec2_ami_id           = var.ec2_ami_id
  instance_type        = var.instance_type
  volume_size          = var.volume_size
  volume_type          = var.volume_type
  subnet_id            = module.vpc.public_subnet_id
  security_group_ids   = [module.sg.security_group_id]
  iam_instance_profile = module.iam.instance_profile_name
}
