resource "aws_autoscaling_group" "this" {
  name                      = var.autoscaling_group.name
  max_size                  = var.autoscaling_group.max_size
  min_size                  = var.autoscaling_group.min_size
  health_check_grace_period = var.autoscaling_group.health_check_grace_period
  health_check_type         = var.autoscaling_group.health_check_type
  desired_capacity          = var.autoscaling_group.desired_capacity
  vpc_zone_identifier       = var.launch_template.vpc_zone_identifier

  launch_template {
    name    = aws_launch_template.this.name
    version = "$Latest"
  }

  instance_maintenance_policy {
    min_healthy_percentage = var.control_plane_autoscaling_group.instance_maintenance_policy.min_healthy_percentage
    max_healthy_percentage = var.control_plane_autoscaling_group.instance_maintenance_policy.max_healthy_percentage
  }

  tag {
    key                 = "Project"
    value               = var.tags.Project
    propagate_at_launch = true
  }

  tag {
    key                 = "Environment"
    value               = var.tags.Environment
    propagate_at_launch = false
  }
}
