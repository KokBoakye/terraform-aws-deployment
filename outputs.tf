output "vpc_id" {
  description = "ID of the_VPC"
  value       = module.vpc.vpc_id
  
}

output "web_server_instance_ids" {
  description = "IDs of the EC2 instances"
  value       = module.ec2.web_server_instance_ids
}

output "public_ips" {
  description = "Public IPs of the EC2 instances"
  value       = module.ec2.public_ip
}

output "bastion_host_public_ip" {
  description = "Public IP of the bastion host"
  value       = module.ec2.bastion_host_public_ip
}

output "rds_endpoint" {
  description = "Endpoint of the RDS instance"
  value       = module.ec2.db_endpoint
}