
module "vpc" {
  source = "./modules/vpc"
  name   = module.vpc.vpc_name
  vpc_cidr_block = var.vpc_cidr_block 
  vpc_tags = var.vpc_tags
  public_subnet_ids = module.subnet.public_subnets
  
}

module "subnet" {
  source = "./modules/subnet"
  vpc_id         = module.vpc.vpc_id
  public_subnets = var.subnet_cidrs
  azs            = var.availability_zones
  public_subnets_enable = true
  subnet_tags = var.subnet_tags
}

module "security_group" {
  source = "./modules/security_group"
  vpc_id = module.vpc.vpc_id
  app_sg_ingress_rule = var.sg_ingress_rule
  app_sg_egress_rule = var.sg_egress_rule
  app_sg_tag = var.app_sg_tag
}

module "ec2" {
  source = "./modules/ec2"
  ami           = var.instance_ami
  instance_type = var.instance_type
  subnet_id     = module.subnet.public_subnets
  sg_id         = module.security_group.sg_id
  
  instance_tags = var.instance_tags
}
