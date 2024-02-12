module "vpc" {
  source             = "./modules/vpc"
  cidr_block         = "10.0.0.0/16"
  vpc_name           = "webapp-vpc"
  vpc_id             = module.vpc.vpc_id
  availability_zones = var.availability_zones
}

module "security_group" {
  source = "./modules/security_group"
  vpc_id = module.vpc.vpc_id
}

module "ec2" {
  source            = "./modules/ec2"
  subnet_id         = module.vpc.public_subnet_id
  security_group_id = module.security_group.security_group_id
}

module "rds" {
  source    = "./modules/rds"
  vpc_id    = module.vpc.vpc_id
  subnet_id = module.vpc.private_subnet_id
}

module "loadbalancer" {
  source     = "./modules/loadbalancer"
  vpc_id     = module.vpc.vpc_id
  subnet_id = [module.vpc.public_subnet_id]
}

module "s3" {
  source = "./modules/s3"
}

module "autoscaling" {
  source    = "./modules/autoscaling"
  vpc_id    = module.vpc.vpc_id
  subnet_id = module.vpc.public_subnet_id
  security_group_id = module.security_group.security_group_id
}