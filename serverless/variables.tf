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

variable "tags" {
  type = object({
    Environment = string
    Project     = string
  })
  default = {
    Environment = "Production"
    Project     = "NSSE"
  }

}

variable "queues" {
  type = list(object({
    name                      = string
    delay_seconds             = number
    max_message_size          = number
    message_retention_seconds = number
    receive_wait_time_seconds = number
    sqs_managed_sse_enabled   = bool
  }))
  default = [
    {
      name                      = "EmailNotificationsQueue"
      delay_seconds             = 0
      max_message_size          = 2048
      message_retention_seconds = 86400
      receive_wait_time_seconds = 10
      sqs_managed_sse_enabled   = true

    },
    {
      name                      = "ProductStockQueue"
      delay_seconds             = 0
      max_message_size          = 2048
      message_retention_seconds = 86400
      receive_wait_time_seconds = 10
      sqs_managed_sse_enabled   = true

    },
    {
      name                      = "InvoiceQueue"
      delay_seconds             = 0
      max_message_size          = 2048
      message_retention_seconds = 86400
      receive_wait_time_seconds = 10
      sqs_managed_sse_enabled   = true

    }
  ]
}

variable "dlqueues" {
  type = list(object({
    name                      = string
    delay_seconds             = number
    max_message_size          = number
    message_retention_seconds = number
    receive_wait_time_seconds = number
    sqs_managed_sse_enabled   = bool
  }))
  default = [
    {
      name                      = "EmailNotificationsQueueDlq"
      delay_seconds             = 0
      max_message_size          = 2048
      message_retention_seconds = 86400
      receive_wait_time_seconds = 10
      sqs_managed_sse_enabled   = true

    },
    {
      name                      = "ProductStockQueueDlq"
      delay_seconds             = 0
      max_message_size          = 2048
      message_retention_seconds = 86400
      receive_wait_time_seconds = 10
      sqs_managed_sse_enabled   = true

    },
    {
      name                      = "InvoiceQueueDlq"
      delay_seconds             = 0
      max_message_size          = 2048
      message_retention_seconds = 86400
      receive_wait_time_seconds = 10
      sqs_managed_sse_enabled   = true

    }
  ]

}

variable "order_confirmed_topic" {
  type = object({
    role_name                        = string
    name                             = string
    sqs_success_feedback_sample_rate = number
    subscriptions                    = list(string)
  })
  default = {


    role_name                        = "SnsTopicRole"
    name                             = "OrderConfirmedTopic"
    sqs_success_feedback_sample_rate = 100
    subscriptions                    = ["InvoiceQueue", "ProductStockQueue"]
  }

}

variable "s3_application_bucket_name" {
  type    = string
  default = "jean-nsse-application-bucket"
}



