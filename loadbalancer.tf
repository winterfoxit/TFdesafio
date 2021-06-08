resource "aws_elb" "elb-desafio02" {
  name            = "elb-terraform-desafio02"
  security_groups = [aws_security_group.sg_desafio02.id]
  subnets         = aws_subnet.subnet-desafio02.*.id

  listener {
    instance_port     = 80
    instance_protocol = "http"
    lb_port           = 80
    lb_protocol       = "http"
  }

  /*
  health_check {
    healthy_threshold   = 2
    unhealthy_threshold = 2
    timeout             = 3
    target              = "HTTP:80/"
    interval            = 30
  }
*/
  instances                   = aws_instance.webserver[*].id
  cross_zone_load_balancing   = true
  idle_timeout                = 400
  connection_draining         = true
  connection_draining_timeout = 400

  tags = {
    Name = "elb-terraform-desafio02"
  }
}