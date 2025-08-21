user = "Kwabena"
environment = "dev" #"prod"
vpc_cidr_block = "10.1.0.0/16"
public_subnet_cidr_block = "10.1.0.0/24"
key_name = "Mendy"
private_subnet_cidr_block = [ "10.1.1.0/24", "10.1.2.0/24" ]
aws_region = "eu-north-1"

instance_type = ["t3.micro", "t3.large"]
app_port = 8080
