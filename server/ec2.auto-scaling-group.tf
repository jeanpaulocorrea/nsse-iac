resource "aws_autoscaling_group" "control_plane" {
  name                      = var.aws_autoscaling_group.name
  max_size                  = var.aws_autoscaling_group.max_size
  min_size                  = var.aws_autoscaling_group.min_size
  health_check_grace_period = var.aws_autoscaling_group.health_check_grace_period
  health_check_type         = var.aws_autoscaling_group.health_check_type
  desired_capacity          = var.aws_autoscaling_group.desired_capacity
  vpc_zone_identifier = data.aws_subnets.private_subnets.ids
    launch_template {
        name = aws_launch_template.control_plane.name
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