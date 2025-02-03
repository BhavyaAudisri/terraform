resource "aws_instance" "terraform" {

    ami_id = var.ami_id
    vpc_security_group_ids = var.sg_id
    instance_type = var.instance_type
    name = "terraform-practice"
    
}