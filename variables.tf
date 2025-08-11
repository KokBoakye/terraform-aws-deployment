variable "user" {
    description = "User of resources"
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

variable "instance_ami" {
    description = "AMI ID for the EC2 instances"
    type        = map(string)
    
}

variable "instance_type" {
    description = "Instance type for the EC2 instances"
    type        = list(string)
    
}

variable "key_name" {
    description = "Key name for the EC2 instances"
    type        = string
    
}

variable "app_port" {
    description = "Application port for backend (for App SG)"
    type        = number
    
}

# variable "availability_zones" {
#     description = "List of availability zones for the VPC"
#     type = list(string)

# }