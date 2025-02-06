resource "aws_instance" "terraform" {
  ami                    = var.ami_id
  vpc_security_group_ids = [aws_security_group.allow-terraform.id]
  instance_type          = var.instance_type
  tags = {
    name = "terraform-practice"
  }
}
output "security" {
 value = aws_security_group.allow-terraform.id
}


resource "aws_instance" "terraform1" {
  ami                    = var.ami_id
  vpc_security_group_ids = [aws_security_group.allow-terraform.id]
  #vpc_security_group_ids = output.security
  instance_type          = var.instance_type
  tags = {
    name = "terraform-practice"
  }
}
output "security" {
 value = aws_security_group.allow-terraform.id
}
