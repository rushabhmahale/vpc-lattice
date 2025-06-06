module "vpcs" {
  source = "git::https://github.com/rushabhmahale/vpc-lattice.git//VPC/root-module?ref=master"
  
  for_each = var.vpc_configs

  vpc_name              = each.value.vpc_name
  vpc_cidr              = each.value.vpc_cidr
  private_subnet_cidrs  = each.value.private_subnet_cidrs
  private_subnet_azs    = each.value.private_subnet_azs
  public_subnet_cidrs   = each.value.public_subnet_cidrs
  public_subnet_azs     = each.value.public_subnet_azs
  enable_nat_gateway    = each.value.enable_nat_gateway
}
