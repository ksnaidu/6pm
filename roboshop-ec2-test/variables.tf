

variable "security_group_ids" {
    default = ["sg-0b03fbb6aa7794779"]
}

variable "tags" {
    default = {
        Name = "roboshop-cart"
        Terraform = "true"
        Environment = "dev"
    }
}

variable "instance_type" {
    default = "t3.small"
}