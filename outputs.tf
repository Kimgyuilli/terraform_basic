# outputs.tf
output "instance_public_ip" {
  description = "Public IP address of the EC2 instance"
  value       = aws_instance.spring_server.public_ip
}

output "instance_public_dns" {
  description = "Public DNS name of the EC2 instance"
  value       = aws_instance.spring_server.public_dns
}

output "application_url" {
  description = "URL to access the application"
  value       = "http://${aws_instance.spring_server.public_ip}:8080"
}

output "ssh_command" {
  description = "SSH command to connect to the instance"
  value       = "ssh -i ~/.ssh/${var.key_pair_name}.pem ubuntu@${aws_instance.spring_server.public_ip}"
}
