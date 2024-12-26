resource "aws_vpc" "main" {
  cidr_block = var.vpc_cidr_block
  tags =  var.vpc_tags
  
}

####################################################

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.main.id
  
}

resource "aws_route_table" "public" {
  vpc_id = aws_vpc.main.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }
}

resource "aws_route_table_association" "public_subnet" {
  subnet_id = var.public_subnet_ids
  route_table_id = aws_route_table.public.id
}