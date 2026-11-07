resource "aws_ssm_parameter" "backend_alb_listner_arn" {
  name  = "/${var.project}/${var.environment}/backend_alb_listner_arn"
  type  = "String"
  value = aws_lb_listner_alb.arn
}