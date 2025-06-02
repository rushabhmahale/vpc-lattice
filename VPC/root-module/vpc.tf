resource "aws_vpc" "this" {
  cidr_block           = var.vpc_cidr
  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = {
    Name = var.vpc_name
  }
}

# Create private subnets from the provided list
resource "aws_subnet" "private" {
  count             = length(var.private_subnet_cidrs)
  vpc_id            = aws_vpc.this.id
  cidr_block        = var.private_subnet_cidrs[count.index]
  availability_zone = var.private_subnet_azs[count.index]
  map_public_ip_on_launch = false

  tags = {
    Name = "${var.vpc_name}-private-${count.index}"
  }
}

# Create public subnets from the provided list
resource "aws_subnet" "public" {
  count             = length(var.public_subnet_cidrs)
  vpc_id            = aws_vpc.this.id
  cidr_block        = var.public_subnet_cidrs[count.index]
  availability_zone = var.public_subnet_azs[count.index]
  map_public_ip_on_launch = true

  tags = {
    Name = "${var.vpc_name}-public-${count.index}"
  }
}

# Create an Internet Gateway
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.this.id

  tags = {
    Name = "${var.vpc_name}-igw"
  }
}

# Whenever NAT is enabled, create an Elastic IP and NAT Gateway in the first public subnet.
resource "aws_eip" "nat" {
  count = var.enable_nat_gateway ? 1 : 0
}

resource "aws_nat_gateway" "nat" {
  count         = var.enable_nat_gateway ? 1 : 0
  allocation_id = aws_eip.nat[0].id
  subnet_id     = aws_subnet.public[0].id

  tags = {
    Name = "${var.vpc_name}-nat"
  }
}

# Create a private route table (without any default route)
resource "aws_route_table" "private_rt" {
  vpc_id = aws_vpc.this.id

  tags = {
    Name = "${var.vpc_name}-private-rt"
  }
}

# Conditionally add a default route if NAT is enabled using a separate resource.
resource "aws_route" "nat_route" {
  count = var.enable_nat_gateway ? 1 : 0

  route_table_id         = aws_route_table.private_rt.id
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id         = aws_nat_gateway.nat[0].id
}

# Associate every private subnet with the private route table
resource "aws_route_table_association" "private_assoc" {
  count          = length(var.private_subnet_cidrs)
  subnet_id      = aws_subnet.private[count.index].id
  route_table_id = aws_route_table.private_rt.id
}

# Create a public route table (routes via the IGW)
resource "aws_route_table" "public_rt" {
  vpc_id = aws_vpc.this.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
    Name = "${var.vpc_name}-public-rt"
  }
}

# Associate every public subnet with the public route table
resource "aws_route_table_association" "public_assoc" {
  count          = length(var.public_subnet_cidrs)
  subnet_id      = aws_subnet.public[count.index].id
  route_table_id = aws_route_table.public_rt.id
}
