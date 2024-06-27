resource "aws_vpc" "vpc-A" {
    cidr_block = "10.100.0.0/16"
    enable_dns_hostnames = true
    tags = {
      Name = "vpc-A"
    }
}

resource "aws_subnet" "vpc-A-public-sub-1" {
    vpc_id = aws_vpc.vpc-A.id
    cidr_block = "10.100.1.0/24"
    map_public_ip_on_launch = true

    tags = {
      Name = "vpc-A-public-sub-1"
    }
}

resource "aws_subnet" "vpc-A-private-sub-1" {
    vpc_id = aws_vpc.vpc-A.id
    cidr_block = "10.100.11.0/24"

    tags = {
      Name = "vpc-A-private-sub-1"
    }
}

resource "aws_internet_gateway" "vpc-A-IGW" {

    vpc_id = aws_vpc.vpc-A.id
    tags = {
      Name = "vpc-A-IGW"
    }
}

resource "aws_route_table" "vpc-A-public-RT" {
    vpc_id = aws_vpc.vpc-A.id

    route  {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.vpc-A-IGW.id
    }

    route {
        cidr_block = "10.100.0.0/16"
        gateway_id = "local"
    }

    tags = {
      Name = "vpc-A-public-RT"
    }
}

resource "aws_route_table" "vpc-A-private-RT" {
    vpc_id = aws_vpc.vpc-A.id

    route {
        cidr_block = "10.100.0.0/16"
        gateway_id = "local"
    }

    tags = {
      Name = "vpc-A-private-RT"
    }
}

resource "aws_route_table_association" "vpc-A-public-RT-ass" {
    subnet_id = aws_subnet.vpc-A-public-sub-1.id
    route_table_id = aws_route_table.vpc-A-public-RT.id
}

resource "aws_route_table_association" "vpc-A-private-RT-ass" {
    subnet_id = aws_subnet.vpc-A-private-sub-1.id
    route_table_id = aws_route_table.vpc-A-private-RT.id
}