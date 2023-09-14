# # Create an AWS RDS Database Replica Instance
# resource "aws_db_instance" "replica-myinstance" {
#   instance_class           = var.instance_class  # Set the instance class for the replica
#   skip_final_snapshot      = var.skip_final_snapshot  # Determine if a final snapshot is taken on deletion
#   backup_retention_period = var.backup_retention_period  # Set the backup retention period in days
#   replicate_source_db      = var.replicate_source_db  # Specify the source DB instance to replicate
# }

resource "aws_db_instance" "replica-myinstance" {
  for_each = { for idx, config in var.replica_configurations : idx => config }

  instance_class          = each.value.instance_class
  skip_final_snapshot     = each.value.skip_final_snapshot
  backup_retention_period = each.value.backup_retention_period
  replicate_source_db     = each.value.replicate_source_db
  multi_az                = each.value.multi_az
}