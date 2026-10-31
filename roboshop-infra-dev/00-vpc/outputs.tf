# output "azs_info" {
#     value = module.vpc.azs_info
  
# }

output "vpc_id" {
  value = module.vpc.vpc_id
}


# output "vpc_ids" {
#     value = module.vpc.public_subnet_ids
# }


# output "public_subnet_ids" {
# value = aws_subnet.public[*].id
# }