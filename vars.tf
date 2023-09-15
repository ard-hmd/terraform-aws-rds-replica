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
    identifier              = string
  }))
  default = []
}

variable "replicate_source_db_identifiers" {
  description = "List of identifiers of the RDS instances to replicate."
  type        = list(string)
  default     = []
}