resource "aws_lb" "SalsaSunday_alb" {
  name               = "SalsaSunday-load-balancer"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.SalsaSunday-LB01-SG01.id]
  subnets = [
    aws_subnet.public-us-west-2a.id,
    aws_subnet.public-us-west-2b.id,
    aws_subnet.public-us-west-2c.id,
  ]
  enable_deletion_protection = false
  #Lots of death and suffering here, make sure it's false

  tags = {
    Name    = "SalsaSundayLoadBalancer"
    Service = "Multiapp"
    Owner   = "Chewbacca"
    Project = "Multiapp"
  }
}

resource "aws_lb_listener" "http" {
  load_balancer_arn = aws_lb.SalsaSunday_alb.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.SalsaSunday_tg_80.id
  }
}
data "aws_acm_certificate" "cert" {
  domain      = "michaelchurchill.click"
  statuses    = ["ISSUED"]
  most_recent = true
}


resource "aws_lb_listener" "https" {
  load_balancer_arn = aws_lb.SalsaSunday_alb.arn
  port              = 443
  protocol          = "HTTPS"
  ssl_policy        = "ELBSecurityPolicy-2016-08" # or whichever policy suits your requirements
  certificate_arn   = data.aws_acm_certificate.cert.arn



  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.SalsaSunday_tg_443.arn
  }
}

output "lb_dns_name" {
  value       = aws_lb.SalsaSunday_alb.dns_name
  description = "The DNS name of the SalsaSunday Load Balancer."
}
