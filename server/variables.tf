variable "region" {
  type    = string
  default = "us-east-1"

}
variable "assume_role" {
  type = object({
    role_arn    = string
    external_id = string
  })

  default = {
    role_arn    = "arn:aws:iam::080744442776:role/terraform-role"
    external_id = "a690f6f2-7ca0-4851-ba7a-c2282887c529"
  }


}

variable "ec2_resources" {
  type = object({

    key_pair_name = string
    instance_role = string
    instance_profile = string
    ssh_security_group = string
    ssh_source_ip = string
  })

  default = {
    key_pair_name = "nsse-production-key-pair"
    instance_role = "nsse-production-instance-role"
    instance_profile = "nsse-production-instance-profile"
    ssh_security_group = "allow-ssh"
    ssh_source_ip = "192.141.97.50/32"
  }
  
}

variable "control_plane_launch_template" {

  type = object({
    name = string
    disable_api_stop = bool
    disable_api_termination = bool
    instance_type = string
    instance_initiated_shutdown_behavior = string
    ebs = object({
      size = number
      delete_on_termination = bool
    })
    
  
  })

  default = {
    name = "nsse-production-debian-control-plane-lt"
    disable_api_stop = "true"
    disable_api_termination = "true"
    instance_type = "t3.micro"
    instance_initiated_shutdown_behavior = "terminate"
    ebs = {
      size = 20
      delete_on_termination = false
    }
  

  }

}

variable "vpc_resources" {
  type = object({
    vpc = string
  })

  default = {
    vpc = "nsse-production-vpc"
  }
  
}

variable "tags" {
  type = map(string)
  default = {
    Environment = "Production"
    Project     = "NSSE"
  }
  
}

variable "control_plane_autoscaling_group" {
  type = object({
    name = string
    max_size = number
    min_size = number
    desired_capacity = number
    health_check_grace_period = number
    health_check_type = string
    instance_maintenance_policy = object({
      min_healthy_percentage = number
      max_healthy_percentage = number
    })
  })

  default = {
    name = "nsse-production-control-plane-asg"
    max_size = 1
    min_size = 1
    desired_capacity = 1
    health_check_grace_period = 180
    health_check_type = "EC2"
    instance_maintenance_policy = {
      min_healthy_percentage = 100
      max_healthy_percentage = 110
    }
  }
  
}