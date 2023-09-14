# # Define the DB instance class for the replica
# variable "instance_class" {
#   description = "The DB instance class."  # Describing the purpose of the variable
#   default     = "db.t2.micro"  # Providing a default value
# }

# # Define whether a final DB snapshot is created before deletion
# variable "skip_final_snapshot" {
#   description = "Determines whether a final DB snapshot is created before the DB instance is deleted."  # Describing the purpose of the variable
#   default     = true  # Providing a default value
# }

# # Define the number of days for automated backups retention
# variable "backup_retention_period" {
#   description = "The number of days for which automated backups are retained."  # Describing the purpose of the variable
#   default     = 0  # Providing a default value
# }

# # Define the identifier of the source DB instance to replicate from
# variable "replicate_source_db" {
#   description = "The identifier of the source DB instance from which to replicate."  # Describing the purpose of the variable
#   type        = string  # Specifying the data type
# }

# Set the default AWS region for the resources
variable "aws_region" {
  default = "eu-west-3"
  description = "Default AWS region where resources will be created."
}

variable "replica_configurations" {
  description = "List of replica configurations."
  type = list(object({
    instance_class          = string
    skip_final_snapshot     = bool
    backup_retention_period = number
    replicate_source_db     = string
    multi_az                = bool
    apply_immediately       = bool
  }))
  default = []
}