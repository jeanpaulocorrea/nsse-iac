output "dlqueue_urls" {
  value = aws_sqs_queue.deadletter.*.id
}
output "queue_urls" {
  value = aws_sqs_queue.nsse.*.id
}
