resource "aws_route53_record" "database" {
  zone_id = var.zone_id
  name    = "database.winterfoxit.com.br"
  type    = "CNAME"
  ttl     = "300"
  records = ["${aws_db_instance.desafio02.address}"]
}

resource "aws_route53_record" "desafio02" {
  zone_id = var.zone_id
  name    = "desafio02.winterfoxit.com.br"
  type    = "CNAME"
  ttl     = "300"
  records = ["${aws_elb.elb-desafio02.dns_name}"]
}