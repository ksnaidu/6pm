##vpc-roboshop-dev

resource "aws_vpc" "main" {
    cidr_block = var.cidr_block
    instance_tenancy = "default"
    enable_dns_hostnames = "true" ##host-names enable purpose
  
  tags = merge(
    var.vpc_tags,
    local.common_tags,
    {
        Name = "${var.project}-${var.environment}"
    }
  )
}


##igw roboshop-dev

resource "aws_internet_gateway" "main" {
  vpc_id = aws_vpc.main.id ##association with vpc

  tags = merge(
    var.igw_tags,
    local.common_tags,
    {
       Name = "${var.project}-${var.environment}"
    }
  )
  
}


##subnets

# resource "aws_subnet" "public" {
#   count = length(var.public_subnet_cidr)
#   vpc_id = aws_vpc.main.id
#   cidr_block = var.public_subnet_cidr[count.index]  # exicute 2 subnets


#   tags = {
#     Name = "Main"
#   }
  
# }