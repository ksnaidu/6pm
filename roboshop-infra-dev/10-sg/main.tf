  module "frontend" {
    source = "../../terraform-aws-securitygroup"
	  project = var.project
    environment = var.environment

    sg_name = var.frontend_sg_name
    sg_description = var.frontend_sg_description
    # vpc_id = data.aws_ssm_parameter.vpc_id
    
    vpc_id = local.vpc_id  ##vpc-id stored in ssm parameter after create.
}
  