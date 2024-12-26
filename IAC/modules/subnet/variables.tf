variable "vpc_id" {}

variable "public_subnets" {
    type = string
}

variable "azs" {
    type = string
}

variable "subnet_tags" {
  type = map(string)
}

variable "public_subnets_enable" {
  type = bool
}