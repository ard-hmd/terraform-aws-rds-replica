resource "aws_db_instance" "replica-myinstance" {
  for_each = { for idx, config in var.replica_configurations : idx => config }

  instance_class          = each.value.instance_class
  skip_final_snapshot     = each.value.skip_final_snapshot
  backup_retention_period = each.value.backup_retention_period
  replicate_source_db     = each.value.replicate_source_db
  multi_az                = each.value.multi_az
  apply_immediately       = each.value.apply_immediately
  identifier              = each.value.identifier
  availability_zone       = each.value.availability_zone

  tags = {
    Name = "${var.resource_name_prefix}${each.value.identifier}"
  }
}
