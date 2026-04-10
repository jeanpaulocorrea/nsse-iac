resource "aws_launch_template" "this" {
  name                                 = var.control_plane_launch_template.name
  disable_api_stop                     = var.control_plane_launch_template.disable_api_stop
  disable_api_termination              = var.control_plane_launch_template.disable_api_termination
  instance_type                        = var.control_plane_launch_template.instance_type
  key_name                             = var.launch_template.key_name
  image_id                             = var.launch_template.image_id
  instance_initiated_shutdown_behavior = var.aws_launch_template.instance_initiated_shutdown_behavior
  vpc_security_group_ids               = var.launch_template.vpc_secuimage_idrity_group_ids
  user_data                            = var.launch_template.user_data

  block_device_mappings {
    device_name = "/dev/sdf"

    ebs {
      volume_size           = var.control_plane_launch_template.ebs.size
      delete_on_termination = var.control_plane_launch_template.ebs.delete_on_termination
    }
  }

  credit_specification {
    cpu_credits = "standard"
  }



  iam_instance_profile {
    # name = aws_iam_instance_profile.instance_profile.name
    name = var.instance_profile_name
  }

  tag_specifications {
    resource_type = "instance"
    tags          = vars.tags



  }
}

