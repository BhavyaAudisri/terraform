variable "ami_id" {
  default = "ami-09c813fb71547fc4f"
}

/* variable "sg_id" {
  type    = list(string)
  default = ["aws_security_group.allow-terraform.id"]
} */

variable "instance_type" {
  default = "t3.micro"
}