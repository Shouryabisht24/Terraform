#output "arn" {
#  value = aws_instance.testinstance.arn
#}

#output "public_ip" {
#  value = aws_instance.testinstance.public_ip
#}

output "subnet_id" {
  value = aws_subnet.test.id
}

#output "ec2_public_dns" {
#  value = aws_instance.testinstance.public_dns
#}

output "ec2_public_dns" {
  value = {
    for k, v in aws_instance.testinstance :
    k => v.public_dns
  }
}

output "ec2_public_ip" {
  value = {
    for k, v in aws_instance.testinstance :
    k => v.public_ip
  }
}