output "alb_dns_name" {
  description = "DNS name of the load balancer"
  value       = aws_lb.app_alb.dns_name
}

output "bastion_host_public_ip" {
    description = "public_ip of bastion host"
    value = module.ec2.public_ip
}

output "private_server_private_ip" {
    description = "private ip of server in private subnet"
    value = module.ec2.private_ip
}