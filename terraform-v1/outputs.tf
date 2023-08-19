output "nome_do_output" {
  value = aws_s3_bucket.nome-do-bucket
}

output "bucket_arn" {
  value = aws_s3_bucket.nome-do-bucket.arn
  description = "value"
}