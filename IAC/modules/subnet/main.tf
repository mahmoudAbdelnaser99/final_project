resource "aws_subnet" "public" {
  vpc_id            = var.vpc_id
  cidr_block        = element(var.public_subnets, count.index)
  availability_zone = element(var.azs, count.index)
  map_public_ip_on_launch = var.public_subnets_enable

  tags = var.subnet_tags
}