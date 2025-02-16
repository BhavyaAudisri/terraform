resource "aws_instance" "server1" {
  ami                    = "ami-09c813fb71547fc4f"
  count                  = length(var.instances)
  instance_type          = "t3.micro"
  vpc_security_group_ids = [aws_security_group.sg[count.index].id]
  tags = {
    Name = var.instances[count.index]
  }
}

resource "aws_security_group" "sg" {
  count       = length(var.security_groups)
  name        = var.security_groups[count.index]
  description = "Allow nginx-sec inbound traffic and all outbound traffic"
  
  tags = {
    Name = var.security_groups[count.index]
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]

  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]

  }
}
resource "aws_s3_bucket" "load-bal" {
  bucket = "load-bal-tf-bucket"
  tags = {
    Name        = "load-bucket"
    Environment = "practice-terraform"
  }
}
resource "aws_dynamodb_table" "basic" {
  name           = "load-bal-tf-bucket"
  billing_mode   = "PROVISIONED"
  read_capacity  = 20
  write_capacity = 20
  hash_key       = "LockID"
  
  attribute {
    name = "LockID"
    type = "S"
  }

  tags = {
    Name        = "dynamodb-table-2"
    
  }
}

resource "aws_lb_target_group" "load" {
  name     = "nginx-group"
  port     = 80
  protocol = "HTTP"
  vpc_id   = aws_vpc.main.id
}

resource "aws_vpc" "main" {
  cidr_block = "10.0.0.0/16"
}