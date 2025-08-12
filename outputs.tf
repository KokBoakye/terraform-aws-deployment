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