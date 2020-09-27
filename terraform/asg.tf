# Sets up an autoscaling group, with 3 nodes, using our ubuntu LC

resource "aws_placement_group" "app" {
  name     = "app"
  strategy = "cluster"
}

resource "aws_autoscaling_group" "app" {
  name                      = "app-asg"
  max_size                  = 5
  min_size                  = 3
  health_check_grace_period = 300
  health_check_type         = "ELB"
  desired_capacity          = 3
  force_delete              = true
  placement_group           = aws_placement_group.app.id
  launch_configuration      = aws_launch_configuration.app.name
  vpc_zone_identifier       = var.aws_subnets
  load_balancers            = aws_elb.app.name

  tag {
    key                 = "app"
    value               = "weather"
    propagate_at_launch = true
  }

  timeouts {
    delete = "15m"
  }
}
