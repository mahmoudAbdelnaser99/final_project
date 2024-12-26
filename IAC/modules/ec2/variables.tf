variable "subnet_id" {}
variable "sg_id" {}

variable "ami" {
    type = string
}

variable "instance_type" {
    type = string
}

variable "instance_tags" {
    type = map(string)
}