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