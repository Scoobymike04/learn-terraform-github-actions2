
data "aws_route53_zone" "main" {
  name         = "michaelchurchill.click" # The domain name you want to look up
  private_zone = false
}


resource "aws_route53_record" "www" {
  zone_id = data.aws_route53_zone.main.zone_id
  name    = "michaelchurchill.click"
  type    = "A"

  alias {
    name                   = aws_lb.SalsaSunday_alb.dns_name
    zone_id                = aws_lb.SalsaSunday_alb.zone_id
    evaluate_target_health = true
  }
}
