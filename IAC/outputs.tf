output "vpc_id" {
  value = module.vpc.vpc_id
}

output "public_ip" {
  value = module.ec2.public_ip
}

output "sg_id" {
  value = module.security_group.sg_id
}

output "public_subnets" {
  value = module.subnet.public_subnets
}

