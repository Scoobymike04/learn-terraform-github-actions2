resource "aws_autoscaling_group" "SalsaSunday_asg_80" {
  name_prefix      = "SalsaSunday-auto-scaling-group-"
  min_size         = 1
  max_size         = 4
  desired_capacity = 3
  vpc_zone_identifier = [
    aws_subnet.private-us-west-2a.id,
    aws_subnet.private-us-west-2b.id,
    aws_subnet.private-us-west-2c.id
  ]
  health_check_type         = "ELB"
  health_check_grace_period = 300
  force_delete              = true
  target_group_arns         = [aws_lb_target_group.SalsaSunday_tg_80.arn]

  launch_template {
    id      = aws_launch_template.SalsaSunday-LT-80.id
    version = "$Latest"
  }

  enabled_metrics = ["GroupMinSize", "GroupMaxSize", "GroupDesiredCapacity", "GroupInServiceInstances", "GroupTotalInstances"]

  # Instance protection for launching
  initial_lifecycle_hook {
    name                  = "instance-protection-launch"
    lifecycle_transition  = "autoscaling:EC2_INSTANCE_LAUNCHING"
    default_result        = "CONTINUE"
    heartbeat_timeout     = 60
    notification_metadata = "{\"key\":\"value\"}"
  }

  # Instance protection for terminating
  initial_lifecycle_hook {
    name                 = "scale-in-protection"
    lifecycle_transition = "autoscaling:EC2_INSTANCE_TERMINATING"
    default_result       = "CONTINUE"
    heartbeat_timeout    = 300
  }

  tag {
    key                 = "Name"
    value               = "SalsaSunday-instance-80"
    propagate_at_launch = true
  }

  tag {
    key                 = "Environment"
    value               = "Production"
    propagate_at_launch = true
  }
}


# Auto Scaling Policy
resource "aws_autoscaling_policy" "SalsaSunday_scaling_policy_80" {
  name                   = "SalsaSunday-cpu-target"
  autoscaling_group_name = aws_autoscaling_group.SalsaSunday_asg_80.name

  policy_type               = "TargetTrackingScaling"
  estimated_instance_warmup = 120

  target_tracking_configuration {
    predefined_metric_specification {
      predefined_metric_type = "ASGAverageCPUUtilization"
    }
    target_value = 75.0
  }
}

# Enabling instance scale-in protection
resource "aws_autoscaling_attachment" "SalsaSunday_asg_attachment_80" {
  autoscaling_group_name = aws_autoscaling_group.SalsaSunday_asg_443.name
  alb_target_group_arn   = aws_lb_target_group.SalsaSunday_tg_80.arn
}


resource "aws_autoscaling_group" "SalsaSunday_asg_443" {
  name_prefix      = "SalsaSunday-auto-scaling-group-"
  min_size         = 1
  max_size         = 4
  desired_capacity = 3
  vpc_zone_identifier = [
    aws_subnet.private-us-west-2a.id,
    aws_subnet.private-us-west-2b.id,
    aws_subnet.private-us-west-2c.id
  ]
  health_check_type         = "ELB"
  health_check_grace_period = 300
  force_delete              = true
  target_group_arns         = [aws_lb_target_group.SalsaSunday_tg_443.arn]

  launch_template {
    id      = aws_launch_template.SalsaSunday-LT-443.id
    version = "$Latest"
  }

  enabled_metrics = ["GroupMinSize", "GroupMaxSize", "GroupDesiredCapacity", "GroupInServiceInstances", "GroupTotalInstances"]

  # Instance protection for launching
  initial_lifecycle_hook {
    name                  = "instance-protection-launch"
    lifecycle_transition  = "autoscaling:EC2_INSTANCE_LAUNCHING"
    default_result        = "CONTINUE"
    heartbeat_timeout     = 60
    notification_metadata = "{\"key\":\"value\"}"
  }

  # Instance protection for terminating
  initial_lifecycle_hook {
    name                 = "scale-in-protection"
    lifecycle_transition = "autoscaling:EC2_INSTANCE_TERMINATING"
    default_result       = "CONTINUE"
    heartbeat_timeout    = 300
  }

  tag {
    key                 = "Name"
    value               = "SalsaSunday_443"
    propagate_at_launch = true
  }

  tag {
    key                 = "Environment"
    value               = "Production"
    propagate_at_launch = true
  }
}


# Auto Scaling Policy
resource "aws_autoscaling_policy" "SalsaSunday_scaling_policy_443" {
  name                   = "SalsaSunday-cpu-target"
  autoscaling_group_name = aws_autoscaling_group.SalsaSunday_asg_443.name

  policy_type               = "TargetTrackingScaling"
  estimated_instance_warmup = 120

  target_tracking_configuration {
    predefined_metric_specification {
      predefined_metric_type = "ASGAverageCPUUtilization"
    }
    target_value = 75.0
  }
}

# Enabling instance scale-in protection
resource "aws_autoscaling_attachment" "SalsaSunday_asg_attachment_443" {
  autoscaling_group_name = aws_autoscaling_group.SalsaSunday_asg_443.name
  alb_target_group_arn   = aws_lb_target_group.SalsaSunday_tg_443.arn
}