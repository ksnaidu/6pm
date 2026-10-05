#creating varaibles

variable "ami_id" {
    type = string
      default = "ami-0220d79f3f480ecf5"
      description = "AMI id of the RHEL9"
  
}

variable "instance_type" {
default = "t3.micro"
    type = string
    description = "Instance size"

}

variable "tags" {
    type = map 
  
}

