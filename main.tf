module "vpc" {
    source = "git::https://github.com/KokBoakye/terraform-aws-modules.git//modules/vpc?ref=main"

    environment = var.environment
    user = var.user
    vpc_cidr_block = var.vpc_cidr_block
    public_subnet_cidr_block = var.public_subnet_cidr_block
    private_subnet_cidr_block = var.private_subnet_cidr_block
    web_server_instance_ids = module.ec2.web_server_instance_ids
    alb_sg_id = module.security-group.alb_sg_id


    }

    module "ec2" {
        source = "git::https://github.com/KokBoakye/terraform-aws-modules.git//modules/ec2?ref=main"

        instance_type = var.instance_type
        key_name = var.key_name
        instance_ami = var.instance_ami
        public_subnet_ids = module.vpc.public_subnet_ids
        private_subnet_ids = module.vpc.private_subnet_ids
        security_group = module.security-group.web_sg_id
        vpc_id = module.vpc.vpc_id
        bastion_security_group = module.security-group.bastion_sg_id
        web_security_group = module.security-group.web_sg_id
        private_security_group = [module.security-group.app_sg_id]
        db_private_security_group = [module.security-group.db_sg_id]
        private_db_subnet_group = module.vpc.private_db_subnet_group_id
        
    }

     module "security-group" {
        source = "git::https://github.com/KokBoakye/terraform-aws-modules.git//modules/security-group?ref=main"

        app_port = var.app_port
        vpc_id = module.vpc.vpc_id
    }