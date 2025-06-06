variable "vpc_configs" {
  description = "Map of VPC configurations. Each entry contains the VPC name, CIDR block, lists of private and public subnets (with their CIDRs and AZs), and the NAT Gateway flag."
  type = map(object({
    vpc_name              = string
    vpc_cidr              = string
    private_subnet_cidrs  = list(string)
    private_subnet_azs    = list(string)
    public_subnet_cidrs   = list(string)
    public_subnet_azs     = list(string)
    enable_nat_gateway    = bool
  }))
}
