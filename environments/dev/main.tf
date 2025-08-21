module "vpc" {
    source = "git::https://github.com/KokBoakye/terraform-aws-modules.git//modules/vpc?ref=main"

    environment = var.environment
    aws_region = var.aws_region
    vpc_cidr_block = var.vpc_cidr_block
    private_subnet_cidr_block = var.private_subnet_cidr_block[*]
    public_subnet_cidr_block = var.public_subnet_cidr_block
    user = var.user

}

module "ec2" {
    source = "git::https://github.com/KokBoakye/terraform-aws-modules.git//modules/ec2?ref=main"

    environment = var.environment
    aws_region = var.aws_region
    vpc_id = module.vpc.vpc_id
    public_subnet_ids = module.vpc.public_subnet_ids
    private_subnet_ids = module.vpc.private_subnet_ids
    user = var.user
    instance_type = var.instance_type[*]
    # instance_ami = var.instance_ami
    key_name = var.key_name
    security_group = module.security-group.web_sg_id
   
}

module "security-group" {
    source = "git::https://github.com/KokBoakye/terraform-aws-modules.git//modules/security-group?ref=main"

    region = var.aws_region
    vpc_id = module.vpc.vpc_id
    app_port = var.app_port
   
}

