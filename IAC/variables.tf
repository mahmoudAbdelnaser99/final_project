variable "aws_region" {}

variable "vpc_cidr_block" {}
variable "vpc_name" {}

variable "subnet_cidrs" {}

variable "availability_zones" {}

variable "instance_ami" {}

variable "instance_type" {}

variable "vpc_tags" {
  type = map(string)
  default = {
    Name = "Main_VPC"
  }
}

variable "subnet_tags" {
  type = map(string)
  default = {
    Name = "public-subnet-${count.index}"
  }
}

variable "instance_tags" {
  type = map(string)
  default = {
    Name = "Main_Ec2_Instance"
  } 
}

variable "app_sg_tag" {
  type = map(string)
  default = {
    Name = "main_security_group"
  }
}

# security group ingress port 4000 and 80
variable "sg_ingress_rule" {
  type = map(object({
  from_port   = number
  to_port     = number
  protocol    = string
  cidr_blocks = list(string)
  }))
  default     = {
    custom_rule = {
      from_port   = 4000
      to_port     = 4000
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
    http_rule = {
      from_port   = 80
      to_port     = 80
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }
}
# security group egress
variable "sg_egress_rule" {
  type = map(object({
  from_port   = number
  to_port     = number
  protocol    = string
  cidr_blocks = list(string)
  }))
  default     = {
    example_rule = {
      from_port   = 0
      to_port     = 0
      protocol    = "-1"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }
}







