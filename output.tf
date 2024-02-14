output "public_ip" {
  value = aws_instance.firstEC2[*].public_ip
}