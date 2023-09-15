# resource "aws_db_instance" "replica-myinstance" {
#   for_each = { for idx, config in var.replica_configurations : idx => config }

#   instance_class          = each.value.instance_class
#   skip_final_snapshot     = each.value.skip_final_snapshot
#   backup_retention_period = each.value.backup_retention_period
#   replicate_source_db     = each.value.replicate_source_db
#   multi_az                = each.value.multi_az
#   apply_immediately       = each.value.apply_immediately
#   identifier              = each.value.identifier
# }

resource "aws_db_instance" "replica-myinstance" {
  for_each = { for idx, config in var.replica_configurations : idx => config }

  instance_class          = each.value.instance_class
  skip_final_snapshot     = each.value.skip_final_snapshot
  backup_retention_period = each.value.backup_retention_period
  replicate_source_db     = var.replicate_source_db_identifiers[each.key] # Utilisation de la variable pour définir l'instance source à répliquer
  multi_az                = each.value.multi_az
  apply_immediately       = each.value.apply_immediately
  identifier              = replace("${var.replicate_source_db_identifiers[each.key]}-replica", "-", "_") # Remplacement des tirets par des traits de soulignement
}