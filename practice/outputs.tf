output "ec2_private_ip" {
  value = aws_instance.expense[*].private_ip
}