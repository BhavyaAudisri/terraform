variable "ami_id" {
  default = "ami-09c813fb71547fc4f"
}

variable "sg_id" {
  default = "aws_security_group.terraform-practice.id"
}

variable "instance_type" {
  default = "t3.micro"
}