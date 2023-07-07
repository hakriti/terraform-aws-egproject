resource "aws_vpc" "egprojectVPC" {
  cidr_block           = var.VpcCIDR
  instance_tenancy     = "default"
  enable_dns_support   = "true"
  enable_dns_hostnames = "true"

  tags = {
    Name = "egproject"
  }
}

resource "aws_subnet" "PUB-SUBNET-1" {
  vpc_id                  = aws_vpc.egprojectVPC.id
  cidr_block              = var.PUBsubnetCIDER1
  map_public_ip_on_launch = "true"
  availability_zone       = var.ZONE1

  tags = {
    Name = "PUB-SUBNET-1"
  }
}

resource "aws_subnet" "PUB-SUBNET-2" {
  vpc_id                  = aws_vpc.egprojectVPC.id
  cidr_block              = var.PUBsubnetCIDER2
  map_public_ip_on_launch = "true"
  availability_zone       = var.ZONE2

  tags = {
    Name = "PUB-SUBNET-2"
  }
}

resource "aws_subnet" "PUB-SUBNET-3" {
  vpc_id                  = aws_vpc.egprojectVPC.id
  cidr_block              = var.PUBsubnetCIDER3
  map_public_ip_on_launch = "true"
  availability_zone       = var.ZONE3

  tags = {
    Name = "PUB-SUBNET-3"
  }
}

resource "aws_subnet" "PRIV-SUBNET-1" {
  vpc_id                  = aws_vpc.egprojectVPC.id
  cidr_block              = var.PRIVsubnetCIDER1
  map_public_ip_on_launch = "true"
  availability_zone       = var.ZONE1

  tags = {
    Name = "PRIV-SUBNET-1"
  }
}

resource "aws_subnet" "PRIV-SUBNET-2" {
  vpc_id                  = aws_vpc.egprojectVPC.id
  cidr_block              = var.PRIVsubnetCIDER2
  map_public_ip_on_launch = "true"
  availability_zone       = var.ZONE2

  tags = {
    Name = "PRIV-SUBNET-2"
  }
}

resource "aws_subnet" "PRIV-SUBNET-3" {
  vpc_id                  = aws_vpc.egprojectVPC.id
  cidr_block              = var.PRIVsubnetCIDER3
  map_public_ip_on_launch = "true"
  availability_zone       = var.ZONE3

  tags = {
    Name = "PRIV-SUBNET-3"
  }
}

resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.egprojectVPC.id

  tags = {
    Name = "egproject"
  }
}

resource "aws_route_table" "egprojectrout" {
  vpc_id = aws_vpc.egprojectVPC.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gw.id
  }

  tags = {
    Name = "egproject"
  }
}
resource "aws_route_table_association" "routetabepub1" {
  subnet_id      = aws_subnet.PUB-SUBNET-1.id
  route_table_id = aws_route_table.egprojectrout.id
}

resource "aws_route_table_association" "routetabepub2" {
  subnet_id      = aws_subnet.PUB-SUBNET-2.id
  route_table_id = aws_route_table.egprojectrout.id
}

resource "aws_route_table_association" "routetabepub3" {
  subnet_id      = aws_subnet.PUB-SUBNET-3.id
  route_table_id = aws_route_table.egprojectrout.id
}


