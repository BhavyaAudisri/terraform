output "ec2-public_ips" {
  value = aws_instance.server1[*].public_ip
}
output "sec-group-id" {
  value = aws_security_group.sg[*].id
 }