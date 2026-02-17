output "ec2_instances_public_ips" {
  value       = aws_instance.linux[*].public_ip
  description = "Public IP addresses of the EC2 instances"
}