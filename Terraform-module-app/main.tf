# dev 

module "dev-app" {
  source        = "./infra"
  env           = "dev"
  instance_type = "t3.micro"
  ami           = "ami-0320940581663281e"
}

#prd
module "prd-app" {
  source        = "./infra"
  env           = "prd"
  instance_type = "c7i-flex.large"
  ami           = "ami-0320940581663281e"
}

#stg
module "stg-app" {
  source        = "./infra"
  env           = "stg"
  instance_type = "t3.small"
  ami           = "ami-0320940581663281e"

}
output "dev_app_public_ips" {
  value       = module.dev-app.ec2_instances_public_ips
  description = "Public IPs of the dev environment EC2 instances"
}

output "prd_app_public_ips" {
  value       = module.prd-app.ec2_instances_public_ips
  description = "Public IPs of the prd environment EC2 instances"
}

output "stg_app_public_ips" {
  value       = module.stg-app.ec2_instances_public_ips
  description = "Public IPs of the stg environment EC2 instances"
}