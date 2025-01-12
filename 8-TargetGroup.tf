resource "aws_lb_target_group" "SalsaSunday_tg_80" {
  name        = "SalsaSunday-target-group"
  port        = 80
  protocol    = "HTTP"
  vpc_id      = aws_vpc.SalsaSunday.id
  target_type = "instance"

  health_check {
    enabled             = true
    interval            = 30
    path                = "/"
    protocol            = "HTTP"
    healthy_threshold   = 5
    unhealthy_threshold = 2
    timeout             = 5
    matcher             = "200"
  }

  tags = {
    Name    = "SalsaSunday_tg_80"
    Service = "SalsaSunday"
    Owner   = "Chewbacca"
    Project = "SalsaSunday"
  }
}

resource "aws_lb_target_group" "SalsaSunday_tg_443" {
  name        = "SalsaSunday-tg-443"
  port        = 80
  protocol    = "HTTP"
  vpc_id      = aws_vpc.SalsaSunday.id
  target_type = "instance"

  health_check {
    enabled             = true
    interval            = 30
    path                = "/"
    protocol            = "HTTP"
    healthy_threshold   = 5
    unhealthy_threshold = 2
    timeout             = 5
    matcher             = "200"
  }

  tags = {
    Name    = "SalsaSunday_tg_443"
    Service = "SalsaSunday"
    Owner   = "Chewbacca"
    Project = "SalsaSunday"
  }
}
