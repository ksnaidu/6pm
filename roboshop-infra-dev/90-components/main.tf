module "component" {
  # Local module source
  # source = "../../terraform-aws-roboshop"

  # GitHub module source
  source = "git::https://github.com/ksnaidu/6pm.git//terraform-aws-roboshop?ref=main"

  for_each = var.components

  component     = each.key
  rule_priority = each.value.rule_priority
}
