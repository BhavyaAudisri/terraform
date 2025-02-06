resource "aws_instance" "expense" {
  count                  = length(var.instances)
  ami                    = "ami-09c813fb71547fc4f" # This is our devops-practice AMI ID
  vpc_security_group_ids = [aws_security_group.allow_tls.id]
  instance_type          = "t3.micro"
  tags = merge(
    var.common_tags,
    {
      Name = var.instances[count.index]
    }

  )
  provisioner "local-exec" {
    command = "echo ${self.private_ip} >> inventory"

  }
  
  provisioner "local-exec" {
    when    = destroy
    command = "rm -rf inventory"
  }
}
resource "aws_security_group" "allow_tls" {
  name        = var.project #expense-dev, expense-prod
  description = "Allow TLS inbound traffic and all outbound traffic"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = var.project
  }
}

