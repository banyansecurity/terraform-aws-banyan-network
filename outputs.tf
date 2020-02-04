output "vpc_id" {
    value = aws_vpc.vpc.id
    description = "ID of the VPC that was created for you"
}

output "vpc_cidr" {
    value = var.vpc_cidr
    description = "CIDR block for the entire VPC"
}

output "public_subnet1_id" {
    value = aws_subnet.public1.id
    description = "ID of the public subnet created in the first availability zone"
}

output "public_subnet2_id" {
    value = aws_subnet.public2.id
    description = "ID of the public subnet created in the second availability zone"
}

output "private_subnet1_id" {
    value = aws_subnet.private1.id
    description = "ID of the private subnet created in the first availability zone"
}

output "private_subnet2_id" {
    value = aws_subnet.private2.id
    description = "ID of the private subnet created in the second availability zone"
}
