output "replica_db_instance_arn" {
  description = "he Amazon Resource Name (ARN) of the RDS replica instance."
  value       = { for idx, instance in aws_db_instance.replica-myinstance : idx => instance.arn }
}

output "replica_db_instance_endpoint" {
  description = "The connection endpoint for the RDS replica instance."
  value       = { for idx, instance in aws_db_instance.replica-myinstance : idx => instance.endpoint }
}


output "replica_db_instance_identifier" {
  description = "The connection identifier for the RDS replica instance."
  value       = { for idx, instance in aws_db_instance.replica-myinstance : idx => instance.identifier }
}
