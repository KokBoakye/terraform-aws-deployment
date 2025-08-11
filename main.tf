module "vpc" {
    source = "git::https://github.com/KokBoakye/terraform-aws-modules.git//modules/vpc?ref=main"

    environment = var.environment
    user = var.user
    vpc_cidr_block = var.vpc_cidr_block
    public_subnet_cidr_block = var.public_subnet_cidr_block
    private_subnet_cidr_block = var.private_subnet_cidr_block


    }

    module "ec2"{
        source = "git::https://github.com/KokBoakye/terraform-aws-modules.git//modules/ec2?ref=main"

        instance_type = var.instance_type
        key_name = var.key_name
        ami_id = var.instance_ami_id
        subnet_id = module.vpc.public_subnet_id
        security_group_ids = [module.vpc.web_sg_id]
        vpc_id = module.vpc.vpc_id
    }

     module "security-group"{
        source = "git::https://github.com/KokBoakye/terraform-aws-modules.git//modules/security-group?ref=main"

        app_port = var.app_port
        security_group_name = var.security_group_name
        subnet_id = module.vpc.public_subnet_id
        security_group_ids = [module.vpc.web_sg_id]
        vpc_id = module.vpc.vpc_id
    }