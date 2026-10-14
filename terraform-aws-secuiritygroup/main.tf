##roboshop-dev-frontend
resource "aws_security_group" "main" {
    name = "${var.project}-{var.environment}-${var.sg_name}" ## roboshop-dev-allow-all
    description = var.sg_description
    vpc_id = var.vpc_id

        tags = merge(
        var.sg_tags,
        local.common_tags,
        {
            Name = "${var.project}-{var.environment}-${var.sg_name}"
        }
    )
}
