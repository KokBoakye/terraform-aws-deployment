module "vpc" {
    source = "git::https://github.com/KokBoakye/terraform-aws-modules.git//modules/vpc?ref=main"

    environment = var.environment
    aws_region = var.aws_region
    vpc_cidr_block = var.vpc_cidr_block
    private_subnet_cidr_block = var.private_subnet_cidr_block[*]
    public_subnet_cidr_block = var.public_subnet_cidr_block[*]
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
    key_name = var.key_name
    bastion_sg = module.security-group.bastion_sg_id
    app_sg = module.security-group.app_sg_id
   
}

module "security-group" {
    source = "git::https://github.com/KokBoakye/terraform-aws-modules.git//modules/security-group?ref=main"

    region = var.aws_region
    vpc_id = module.vpc.vpc_id
    app_port = var.app_port
   
}

resource "aws_lb" "app_alb" {
  name               = "${var.environment}-${var.user}-alb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [module.security-group.alb_sg_id]
  subnets           = module.vpc.public_subnet_ids
}

resource "aws_lb_target_group" "app_tg" {
  name     = "${var.environment}-${var.user}-app-tg"
  port     = 80
  protocol = "HTTP"
  vpc_id   = module.vpc.vpc_id

  health_check {
    healthy_threshold   = 5
    unhealthy_threshold = 2
    timeout             = 5
    interval            = 10
    path                = "/"
  }
  
}

resource "aws_lb_listener" "app_listener" {
  load_balancer_arn = aws_lb.app_alb.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.app_tg.arn
  }
}

resource "aws_lb_target_group_attachment" "group_attachment" {
  target_group_arn = aws_lb_target_group.app_tg.arn
  target_id        = module.ec2.instance_id  # string
  port             = 80
}