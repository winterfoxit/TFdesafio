output "ip-address" {
  value = [for i in aws_instance.webserver[*] : join(":", [i.public_ip])]

  description = "The IP address and external port of the container"
}

output "elb_dns_name" {
  description = "The DNS name of the ELB"
  value       = aws_elb.elb-desafio02.dns_name
}

output "rds_instance_endpoint" {
  description = "The RDS connection endpoint"
  value       = aws_db_instance.desafio02.endpoint
}