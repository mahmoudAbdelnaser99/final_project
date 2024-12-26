variable "vpc_id" {}


variable "app_sg_ingress_rule" {
  type = map(object({
  from_port   = number
  to_port     = number
  protocol    = string
  cidr_blocks = list(string)
  }))
}

variable "app_sg_egress_rule" {
  type = map(object({
  from_port   = number
  to_port     = number
  protocol    = string
  cidr_blocks = list(string)
  }))
}


variable "app_sg_tag" {
    type = map(string)
}