output "vpc_id" {
  description = "The ID of the VPC"
  value       = aws_vpc.main.id
}

output "public_subnet_ids" {
  description = "List of IDs of public subnets"
  value       = concat(aws_subnet.public_1.*.id, aws_subnet.public_2.*.id)
}

output "private_subnet_ids" {
  description = "List of IDs of private subnets"
  value       = concat(aws_subnet.private_1.*.id, aws_subnet.private_2.*.id)
}