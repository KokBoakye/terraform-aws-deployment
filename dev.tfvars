user = "kwabena"
private_subnet_cidr_block = ["10.0.5.0/24", "10.0.6.0/24", "10.0.7.0/24", "10.0.8.0/24"]
public_subnet_cidr_block  = ["10.0.0.0/24", "10.0.1.0/24"]
environment = ["dev", "prod"]
vpc_cidr_block = "10.0.0.0/16"
instance_ami = {
    "ubuntu" = "ami-042b4708b1d05f512"
        "amazon_linux_2" = "ami-0b83c7f5e2823d1f4"
        "windows" = "ami-0b59aaac1a4f1a3d1"
        "macos" = "ami-037aceb0f4efe8b1a"
}
key_name = "Mendy" 
instance_type = ["t3.micro", "t3.medium", "t3.large"]
