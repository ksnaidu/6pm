# Create an EC2 Instance
resource "aws_instance" "roboshop" {
  #count=4
  ami                    = var.ami_id # Replace with a valid AMI ID for your region
  for_each               = var.instances
  instance_type          = each.value
  vpc_security_group_ids = [aws_security_group.allow_all.id]

  tags = {
    Name = each.key
  }
}

resource "aws_security_group" "allow_all" {
  name        = var.sg_name
  description = "allow all traffic"

  dynamic "ingress" {
    for_each = var.ingress_ports
    content {
      from_port        = ingress.value["from_port"]
      to_port          = ingress.value["to_port"]
      protocol         = "-1"
      cidr_blocks      = var.cidr_blocks
      ipv6_cidr_blocks = ["::/0"]
    }
  }


  egress {
    from_port        = var.from_port
    to_port          = var.to_port
    protocol         = "-1"
    cidr_blocks      = var.cidr_blocks
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = var.sg_tags

}