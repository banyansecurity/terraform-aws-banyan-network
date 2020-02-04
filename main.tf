terraform {
  required_version = "~> 0.12"
}

provider "aws" {
  version = "~> 2.0"
  region  = var.region
}

resource aws_vpc "vpc" {
    cidr_block           = var.vpc_cidr
    enable_dns_hostnames = true
    enable_dns_support   = true
    tags = {
        Provider = "BanyanOps"
        Name = "banyan-vpc"
    }
}

resource aws_eip "eip" {
    vpc = true
    tags = {
        Name = "banyan-nlb-ip"
        Provider = "BanyanOps"
    }
}

resource aws_internet_gateway "igw" {
    vpc_id = aws_vpc.vpc.id
    tags = {
        Name = "banyan-internet-gw"
        Provider = "BanyanOps"
    }
}

resource aws_nat_gateway "nat" {
    allocation_id = aws_eip.eip.id
    subnet_id = aws_subnet.public1.id
    tags = {
        Name = "banyan-nat-gw"
        Provider = "BanyanOps"
    }
}

resource aws_subnet "public1" {
    vpc_id                  = aws_vpc.vpc.id
    cidr_block              = var.public_cidr1
    availability_zone       = var.zone1
    tags = {
        Name = "banyan-public-zone1"
        Provider = "BanyanOps"
    }
}

resource aws_subnet "public2" {
    vpc_id                  = aws_vpc.vpc.id
    cidr_block              = var.public_cidr2
    availability_zone       = var.zone2
    tags = {
        Name = "banyan-public-zone2"
        Provider = "BanyanOps"
    }
}

resource aws_subnet "private1" {
    vpc_id                  = aws_vpc.vpc.id
    cidr_block              = var.private_cidr1
    availability_zone       = var.zone1
    tags = {
        Name = "banyan-private-zone1"
        Provider = "BanyanOps"
    }
}

resource aws_subnet "private2" {
    vpc_id                  = aws_vpc.vpc.id
    cidr_block              = var.private_cidr2
    availability_zone       = var.zone2
    tags = {
        Name = "banyan-private-zone2"
        Provider = "BanyanOps"
    }
}

resource aws_route_table "public" {
    vpc_id     = aws_vpc.vpc.id

    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.igw.id
    }

    tags = {
        Name = "banyan-public-route-table"
        Provider = "BanyanOps"
    }
}

resource aws_route_table_association "public1" {
    route_table_id = aws_route_table.public.id
    subnet_id = aws_subnet.public1.id
}

resource aws_route_table_association "public2" {
    route_table_id = aws_route_table.public.id
    subnet_id = aws_subnet.public2.id
}

resource aws_route_table "private" {
    vpc_id     = aws_vpc.vpc.id

    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_nat_gateway.nat.id
    }

    tags = {
        Name = "banyan-private-route-table"
        Provider = "BanyanOps"
    }
}

resource aws_route_table_association "private1" {
    route_table_id = aws_route_table.private.id
    subnet_id = aws_subnet.private1.id
}

resource aws_route_table_association "private2" {
    route_table_id = aws_route_table.private.id
    subnet_id = aws_subnet.private2.id
}
