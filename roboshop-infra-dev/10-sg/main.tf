 module "frontend" {
    source = "../../terraform-aws-securitygroup"
	  project = var.project
    environment = var.environment

    sg_name = var.frontend_sg_name
    sg_description = var.frontend_sg_description
    # vpc_id = data.aws_ssm_parameter.vpc_id
    
    vpc_id = local.vpc_id  ##vpc-id stored in ssm parameter after create.
}
  


  module "bastion" {
    source = "../../terraform-aws-securitygroup"
	  project = var.project
    environment = var.environment

    sg_name = var.bastion_sg_name
    sg_description = var.bastion_sg_description
    # vpc_id = data.aws_ssm_parameter.vpc_id
    
    vpc_id = local.vpc_id  ##vpc-id stored in ssm parameter after create.
}
  


resource "aws_security_group_rule" "bastion_laptop" {
  type = "ingress"
  from_port = 22
  to_port = 22
  protocol = "tcp"
  cidr_blocks = ["0.0.0.0/0"]
  security_group_id = module.bastion.sg_id
  
}