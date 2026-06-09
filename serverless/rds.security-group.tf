resource "aws_security_group" "postgressql" {
  name        = var.security_groups.rds
  description = "Managing ports for RDS nodes"
  vpc_id      = data.aws_vpc.this.id

  ingress {
    from_port = 0
    to_port   = 0
    protocol  = "-1"
    security_groups = [
      data.aws_security_group.worker.id,
    ]
  }


  ingress {
    from_port = 0
    to_port   = 0
    protocol  = "-1"
    security_groups = [
      data.aws_security_group.control_plane.id,
    ]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = var.tags
}


