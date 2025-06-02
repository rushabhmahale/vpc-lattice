variable "vpc_name" {
  description = "The name for the VPC"
  type        = string
}

variable "vpc_cidr" {
  description = "The CIDR block for the VPC"
  type        = string
}

variable "private_subnet_cidrs" {
  description = "A list of CIDR blocks for the private subnets"
  type        = list(string)
}

variable "private_subnet_azs" {
  description = "A list of Availability Zones for the private subnets"
  type        = list(string)
}

variable "public_subnet_cidrs" {
  description = "A list of CIDR blocks for the public subnets"
  type        = list(string)
}

variable "public_subnet_azs" {
  description = "A list of Availability Zones for the public subnets"
  type        = list(string)
}

variable "enable_nat_gateway" {
  description = "Boolean flag to enable NAT Gateway creation and associated routing for private subnets"
  type        = bool
}
