output "vpc_id" {
  description = "The ID of the created VPC"
  value       = aws_vpc.this.id
}

output "private_subnet_ids" {
  description = "The IDs of the private subnets"
  value       = aws_subnet.private[*].id
}

output "public_subnet_ids" {
  description = "The IDs of the public subnets"
  value       = aws_subnet.public[*].id
}

output "igw_id" {
  description = "The ID of the Internet Gateway"
  value       = aws_internet_gateway.igw.id
}

output "nat_gateway_id" {
  description = "The ID of the NAT Gateway; will be empty if NAT is disabled"
  value       = var.enable_nat_gateway ? aws_nat_gateway.nat[0].id : ""
}
