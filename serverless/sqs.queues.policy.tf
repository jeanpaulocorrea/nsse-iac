data "aws_iam_policy_document" "sqs_policy" {
  statement {
    effect = "Allow"

    principals {
      type        = "AWS"
      identifiers = ["080744442776"]
    }

    actions   = ["SQS:*"]
    resources = ["*"]
  }
}

