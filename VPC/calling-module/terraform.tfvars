vpc_configs = {
  auth = {
    vpc_name              = "auth-vpc"
    vpc_cidr              = "10.0.0.0/16"
    private_subnet_cidrs  = ["10.0.1.0/24", "10.0.2.0/24"]
    private_subnet_azs    = ["us-east-1a", "us-east-1b"]
    public_subnet_cidrs   = ["10.0.101.0/24"]
    public_subnet_azs     = ["us-east-1a"]
    enable_nat_gateway    = true
  }
#   iot = {
#     vpc_name              = "iot-vpc"
#     vpc_cidr              = "172.16.0.0/16"
#     private_subnet_cidrs  = ["172.16.1.0/24", "172.16.2.0/24"]
#     private_subnet_azs    = ["us-east-1a", "us-east-1b"]
#     public_subnet_cidrs   = ["172.16.101.0/24"]
#     public_subnet_azs     = ["us-east-1a"]
#     enable_nat_gateway    = true
#   }
#   fiveg = {
#     vpc_name              = "5g-vpc"
#     vpc_cidr              = "10.2.0.0/16"
#     private_subnet_cidrs  = ["10.2.1.0/24", "10.2.2.0/24"]
#     private_subnet_azs    = ["us-east-1a", "us-east-1b"]
#     public_subnet_cidrs   = ["10.2.101.0/24"]
#     public_subnet_azs     = ["us-east-1a"]
#     enable_nat_gateway    = true
#   }
}
