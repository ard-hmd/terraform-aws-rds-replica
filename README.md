# Module Terraform AWS RDS Replica

## Description

This Terraform module provisions an AWS RDS replica instance based on provided configurations.

## Features

- Provisions an RDS replica instance.
- Allows customization of instance properties.
- Outputs important attributes of the provisioned replica instance.

## Usage

To use the module in your Terraform configuration, follow the example below:

```hcl
module "rds_replica" {
  source = "github.com/ard-hmd/terraform-aws-rds-replica.git"

  aws_region = "eu-west-3"
  replica_configurations = [
    {
      instance_class          = "db.t2.micro"
      skip_final_snapshot     = true
      backup_retention_period = 7
      replicate_source_db     = "source-db-identifier"
      multi_az                = false
      apply_immediately       = true
      identifier              = "replica-db-identifier"
    }
  ]
}
```

## Variables

- `aws_region`: AWS region where resources will be created. Default is `eu-west-3`.
- `replica_configurations`: List of replica configurations. Each configuration should specify properties like `instance_class`, `skip_final_snapshot`, `backup_retention_period`, `replicate_source_db`, `multi_az`, `apply_immediately`, and `identifier`.

## Outputs

- `replica_db_instance_arn`: The Amazon Resource Name (ARN) of the RDS replica instance.
- `replica_db_instance_endpoint`: The connection endpoint for the RDS replica instance.
- `replica_db_instance_identifier`: The connection identifier for the RDS replica instance.
