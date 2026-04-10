data "aws_iam_policy_document" "assume_role" {
  statement {
    effect = "Allow"

    principals {
      type        = "Service"
      identifiers = ["ec2.amazonaws.com"]
    }

    actions = ["sts:AssumeRole"]
  }
}
resource "aws_iam_instance_profile" "instance_profile" {
  name = var.ec2_resources.instance_profile
  role = var.ec2_resources.instance_role
}


resource "aws_iam_role" "instance_role" {
  name               = var.ec2_resources.instance_role
  path               = "/"
  assume_role_policy = data.aws_iam_policy_document.assume_role.json
  #managed_policy_arns = []
}
