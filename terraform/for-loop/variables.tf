variable "ami_id" {
 type = string
 default = "ami-0220d79f3f480ecf5"
 description = "AMI ID of RHEL9"
}

variable "instance_type" {
    default = "t3.micro"
  
}

 variable "ec2_tags" {
     type = map(string)
     default = {
       name = "roboshop"
      purpose = "variables-demo"

     }
} 


variable "sg_name" {
    default = "allow-all"
  
}

variable "sg_description" {
    default = "Allowing all ports from internet"
  
}

variable "from_port" {
    type = number
    default = 0
  
}

variable "to_port" {
    type = number
    default = 0
  
}

variable "cidr_blocks" {
    type = list(string)
    default = ["0.0.0.0/0"]
  
}

variable "sg_tags" {
    default = {
        Name = "allow-all"
    }
  
}

variable "environment" {
    default = "dev"
  
}

variable "instances" {
    default = {
        mongodb = "t3.micro"  ##each keyword is assigned ofr every iteration.you will get each.key and each.value
        redis = "t3.micro"
        mysql = "t3.small"
        rabbitmq = "t3.micro"
    }
  
}