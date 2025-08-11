variable "user" {
    description = "User for tagging resources"
    type        = string
}

variable "private_subnet_cidr_block" {
    description = "CIDR block for the subnets"
    type = list(string)
    
}

variable "public_subnet_cidr_block" {
    description = "CIDR block for the subnets"
    type = list(string)
    
}

variable "environment" {
    description = "Environment for the AWS resources"
    type = list(string)

}

variable "vpc_cidr_block" {
    description = "CIDR block for the VPC"
    type = string

}

variable "availability_zones" {
    description = "List of availability zones for the VPC"
    type = list(string)

}