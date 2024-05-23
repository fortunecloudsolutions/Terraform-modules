# Admin Vault to set up Vault credentials

Set up the following environment variables

* TF_VAR_access_key 
* TF_VAR_secret_key
* TF_VAR_vault_addr
* TF_VAR_vault_token

# Description
Manages an RDS database instance snapshot

# Inputs
| Name | Description |
| ------------- | ------------- |
|  db_instance_identifier | The DB Instance Identifier from which to take the snapshot. |
|  db_snapshot_identifier | The Identifier for the snapshot. |
|  tags | Key-value map of resource tags |

# Outputs


| Name | Description |
| ------------- | ------------- |
|  availability_zone |Specifies the name of the Availability Zone the DB instance was located in at the time of the DB snapshot. |
|  db_snapshot_arn |The Amazon Resource Name (ARN) for the DB snapshot. |
|  encrypted |Specifies whether the DB snapshot is encrypted. |
|  allocated_storage |Specifies the allocated storage size in gigabytes (GB). |
|  engine |Specifies the name of the database engine. |
|  engine_version |Specifies the version of the database engine. |
|  source_db_snapshot_identifier |The DB snapshot Arn that the DB snapshot was copied from.It only has value in case of cross customer or cross region copy. |       
|  status |Specifies the status of this DB snapshot. |
|  storage_type |Specifies the storage type associated with DB snapshot. |
|  vpc_id |Specifies the storage type associated with DB snapshot. |