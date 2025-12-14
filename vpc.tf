resource "aws_vpc" "main_vpc" {
  cidr_block = var.cidr_block
  tags = {
    Name = var.vpc_tag
  }
}

resource "aws_subnet" "demo-public-subnet-1" {
  vpc_id            = aws_vpc.main_vpc.id
  cidr_block        = var.vpc_public_subnet_1_cidr
  availability_zone = var.vpc_public_subnet_1a_availability_zone
  tags = {
    Name = var.vpc_public_subnet_1_tag
  }
}

resource "aws_subnet" "demo-public-subnet-2" {
  vpc_id            = aws_vpc.main_vpc.id
  cidr_block        = var.vpc_public_subnet_2_cidr
  availability_zone = var.vpc_public_subnet_2b_availability_zone
  tags = {
    Name = var.vpc_public_subnet_2_tag
  }
}

resource "aws_subnet" "demo-private-subnet-2" {
  vpc_id            = aws_vpc.main_vpc.id
  cidr_block        = var.vpc_private_subnet_1_cidr
  availability_zone = var.vpc_private_subnet_1a_availability_zone
  tags = {
    Name = var.vpc_private_subnet_2_tag
  }
}

resource "aws_subnet" "demo-private-subnet-1" {
  vpc_id            = aws_vpc.main_vpc.id
  cidr_block        = var.vpc_private_subnet_2_cidr
  availability_zone = var.vpc_private_subnet_2b_availability_zone
  tags = {
    Name = var.vpc_private_subnet_1_tag
  }
}

resource "aws_internet_gateway" "main_igw" {
  vpc_id = aws_vpc.main_vpc.id
  tags = {
    Name = var.main_igw_tag
  }
}

resource "aws_eip" "nat_eip" {
  domain = var.nat_eip_domain
  tags = {
    Name = var.nat_eip_tag
  }
}

resource "aws_nat_gateway" "main_nat_gw" {
  allocation_id = aws_eip.nat_eip.id
  subnet_id     = aws_subnet.demo-public-subnet-1.id
  tags = {
    Name = var.main_nat_gw_tag
  }

}

resource "aws_route_table" "public_rt" {
  vpc_id = aws_vpc.main_vpc.id
  tags = {
    Name = var.public_rt_tag
  }
}

resource "aws_route_table" "private_rt" {
  vpc_id = aws_vpc.main_vpc.id
  tags = {
    Name = var.private_rt_tag
  }
}

resource "aws_route_table_association" "route_table_association-1" {
  subnet_id      = aws_subnet.demo-public-subnet-1.id
  route_table_id = aws_route_table.public_rt.id
}

resource "aws_route_table_association" "route_table_association-2" {
  subnet_id      = aws_subnet.demo-public-subnet-2.id
  route_table_id = aws_route_table.public_rt.id
}

resource "aws_route_table_association" "route_table_association-3" {
  subnet_id      = aws_subnet.demo-private-subnet-1.id
  route_table_id = aws_route_table.private_rt.id
}

resource "aws_route_table_association" "route_table_association-4" {
  subnet_id      = aws_subnet.demo-private-subnet-2.id
  route_table_id = aws_route_table.private_rt.id
}

resource "aws_route" "public_rt_route" {
  route_table_id         = aws_route_table.public_rt.id
  destination_cidr_block = var.public_rt_route_destination_cidr
  gateway_id             = aws_internet_gateway.main_igw.id
}

resource "aws_route" "private_rt_route" {
  route_table_id         = aws_route_table.private_rt.id
  destination_cidr_block = var.private_rt_route_destination_cidr
  nat_gateway_id         = aws_nat_gateway.main_nat_gw.id
}
