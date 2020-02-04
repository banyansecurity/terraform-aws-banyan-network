variable "region" {
    type = string 
    description = "Region to create network in"
}

variable "zone1" {
    type = string
    description = "Availability zone to create first subnet in"
}

variable "zone2" {
    type = string
    description = "Availability zone to create second subnet in"
}

variable "vpc_cidr" {
    type = string
    default = "10.0.0.0/22"
    description = "Network block to allocate to the entire network"
}

variable "public_cidr1" {
    type = string
    default = "10.0.0.0/24"
    description = "Subset of VPC block to allocate to first public subnet"
}

variable "public_cidr2" {
    type = string
    default = "10.0.1.0/24"
    description = "Subset of VPC block to allocate to second public subnet"
}

variable "private_cidr1" {
    type = string
    default = "10.0.2.0/24"
    description = "Subset of VPC block to allocate to first private subnet"
}

variable "private_cidr2" {
    type = string
    default = "10.0.3.0/24"
    description = "Subset of VPC block to allocate to second private subnet"
}


