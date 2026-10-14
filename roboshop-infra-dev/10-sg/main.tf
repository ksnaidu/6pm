#roboshop-dev-frontend

resource "aws_security_group" "main" {
    name = "${var.project}-${var.environment}-${var.sg_name}"
    description = "sg_creation"
    vpc_id = var.vpc_id

    tags = merge(
        var.sg_tags,
        local.common_tags,
        {
            Name = "${var.project}-${var.environment}-${var.sg_name}"
        }
    )
  
}


  module "frontend" {
    source = "../../terraform-aws-securitygroup"
	  project = var.project
    environment = var.environment

    sg_name = var.frontend_sg_name
    sg_description = var.frontend_sg_description
    # vpc_id = data.aws_ssm_parameter.vpc_id
    
    vpc_id = local.vpc_id  ##vpc-id stored in ssm parameter after create.
}
  