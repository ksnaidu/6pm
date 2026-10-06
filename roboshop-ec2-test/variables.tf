

variable "security_group_ids" {
    default = ["sg-00e52e8a6ee25cff7"]
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