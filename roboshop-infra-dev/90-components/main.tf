module "component" {
    #source = "../../terraform-aws-roboshop"
    source = "git::https://github.com/11am/terraform-aws-roboshop.git?ref=main"
    component = each.key
    rule_priority = each.value.rule_priority
}
