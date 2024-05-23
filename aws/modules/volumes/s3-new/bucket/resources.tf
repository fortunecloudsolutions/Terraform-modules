resource "aws_s3_bucket" "bucket" {
  bucket              = var.bucket
  bucket_prefix       = var.bucket_prefix
  acl                 = var.acl
  policy              = var.policy
  tags                = var.tags
  force_destroy       = var.force_destroy
  acceleration_status = var.acceleration_status
  request_payer       = var.request_payer


  dynamic "website" {
    for_each = var.website != null ? [var.website] : []
    content {
      index_document           = lookup(website.value, "index_document")
      error_document           = lookup(website.value, "error_document", null)
      redirect_all_requests_to = lookup(website.value, "redirect_all_requests_to", null)
      routing_rules            = lookup(website.value, "routing_rules", null)

    }
  }

  dynamic "cors_rule" {
    for_each = var.cors_rule != null ? [var.cors_rule] : []
    content {
      allowed_headers = lookup(cors_rule.value, "allowed_headers", null)
      allowed_methods = lookup(cors_rule.value, "allowed_methods")
      allowed_origins = lookup(cors_rule.value, "allowed_origins")
      expose_headers  = lookup(cors_rule.value, "expose_headers", null)
      max_age_seconds = lookup(cors_rule.value, "max_age_seconds", null)

    }
  }

  dynamic "versioning" {
    for_each = var.versioning != null ? [var.versioning] : []
    content {
      enabled    = lookup(versioning.value, "enabled", null)
      mfa_delete = lookup(versioning.value, "mfa_delete", null)

    }
  }

  dynamic "logging" {
    for_each = var.logging != null ? [var.logging] : []
    content {
      target_bucket = lookup(logging.value, "target_bucket")
      target_prefix = lookup(logging.value, "target_prefix", null)

    }
  }

  dynamic "lifecycle_rule" {
    for_each = var.lifecycle_rule != null ? var.lifecycle_rule : []
    content {
      id                                     = lookup(lifecycle_rule.value, "id", null)
      prefix                                 = lookup(lifecycle_rule.value, "prefix", null)
      tags                                   = lookup(lifecycle_rule.value, "tags", null)
      enabled                                = lookup(lifecycle_rule.value, "enabled")
      abort_incomplete_multipart_upload_days = lookup(lifecycle_rule.value, "abort_incomplete_multipart_upload_days", null)

      dynamic "expiration" {
        for_each = lookup(lifecycle_rule.value, "expiration") != null ? [lookup(lifecycle_rule.value, "expiration")] : []
        content {
          date                         = lookup(expiration.value, "date", null)
          days                         = lookup(expiration.value, "days", null)
          expired_object_delete_marker = lookup(expiration.value, "expired_object_delete_marker", null)
        }
      }

      dynamic "transition" {
        for_each = lookup(lifecycle_rule.value, "transition") != null ? lookup(lifecycle_rule.value, "transition") : []
        content {
          date          = lookup(transition.value, "date", null)
          days          = lookup(transition.value, "days", null)
          storage_class = lookup(transition.value, "storage_class")

        }
      }
      dynamic "noncurrent_version_expiration" {
        for_each = lookup(lifecycle_rule.value, "noncurrent_version_expiration") != null ? [lookup(lifecycle_rule.value, "noncurrent_version_expiration")] : []
        content {
          days = lookup(noncurrent_version_expiration.value, "days")

        }
      }

      dynamic "noncurrent_version_transition" {
        for_each = lookup(lifecycle_rule.value, "noncurrent_version_transition") != null ? lookup(lifecycle_rule.value, "noncurrent_version_transition") : []
        content {
          days          = lookup(noncurrent_version_transition.value, "days")
          storage_class = lookup(noncurrent_version_transition.value, "storage_class")

        }
      }


    }
  }


  dynamic "replication_configuration" {
    for_each = var.replication_configuration != null ? var.replication_configuration : []

    content {
      role = lookup(replication_configuration.value, "role")

      dynamic "rules" {
        for_each = lookup(replication_configuration.value, "rules") != null ? [lookup(replication_configuration.value, "rules")] : []
        content {
          id       = lookup(rules.value, "id", null)
          priority = lookup(rules.value, "priority", null)
          prefix   = lookup(rules.value, "prefix", null)
          status   = lookup(rules.value, "status")

          dynamic "destination" {
            for_each = lookup(rules.value, "destination") != null ? [lookup(rules.value, "destination")] : []

            content {
              bucket             = lookup(destination.value, "bucket")
              storage_class      = lookup(destination.value, "storage_class", null)
              replica_kms_key_id = lookup(destination.value, "replica_kms_key_id", null)
              account_id         = lookup(destination.value, "account_id", null)

              dynamic "access_control_translation" {
                for_each = lookup(destination.value, "access_control_translation") != null ? [lookup(destination.value, "access_control_translation")] : []
                content {
                  owner = lookup(access_control_translation.value, "owner")
                }
              }
            }
          }

          dynamic "source_selection_criteria" {
            for_each = lookup(rules.value, "source_selection_criteria") != null ? [lookup(rules.value, "source_selection_criteria")] : []

            content {

              dynamic "sse_kms_encrypted_objects" {
                for_each = lookup(source_selection_criteria.value, "sse_kms_encrypted_objects") != null ? [lookup(source_selection_criteria.value, "sse_kms_encrypted_objects")] : []

                content {

                  enabled = lookup(sse_kms_encrypted_objects.value, "enabled")
                }
              }
            }
          }

          dynamic "filter" {
            for_each = lookup(rules.value, "filter") != null ? [lookup(rules.value, "filter")] : []

            content {
              prefix = lookup(filter.value, "prefix", null)
              tags   = lookup(filter.value, "tags", null)
            }
          }

        }
      }
    }
  }


  dynamic "server_side_encryption_configuration" {
    for_each = var.server_side_encryption_configuration != null ? [var.server_side_encryption_configuration] : []

    content {

      dynamic "rule" {
        for_each = lookup(server_side_encryption_configuration.value, "rule") != null ? [lookup(server_side_encryption_configuration.value, "rule")] : []

        content {
          bucket_key_enabled = lookup(rule.value, "bucket_key_enabled")

          dynamic "apply_server_side_encryption_by_default" {
            for_each = lookup(rule.value, "apply_server_side_encryption_by_default") != null ? [lookup(rule.value, "apply_server_side_encryption_by_default")] : []

            content {
              sse_algorithm     = lookup(apply_server_side_encryption_by_default.value, "sse_algorithm")
              kms_master_key_id = lookup(apply_server_side_encryption_by_default.value, "kms_master_key_id", null)
            }
          }
        }
      }
    }
  }

  dynamic "object_lock_configuration" {
    for_each = var.object_lock_configuration != null ? [var.object_lock_configuration] : []

    content {
      object_lock_enabled = object_lock_configuration.value.object_lock_enabled

      dynamic "rule" {
        for_each = lookup(object_lock_configuration.value, "rule") != null ? [lookup(object_lock_configuration.value, "rule")] : []

        content {
          dynamic "default_retention" {
            for_each = lookup(rule.value, "default_retention") != null ? [lookup(rule.value, "default_retention")] : []
            content {
              mode  = lookup(default_retention.value, "mode")
              days  = lookup(default_retention.value, "days", null)
              years = lookup(default_retention.value, "years", null)

            }

          }
        }
      }
    }
  }

  dynamic "grant" {
    for_each = var.grant != null ? var.grant : []

    content {
      id          = lookup(grant.value, "id", null)
      type        = lookup(grant.value, "type")
      permissions = lookup(grant.value, "permissions")
      uri         = lookup(grant.value, "uri", null)

    }
  }

}
