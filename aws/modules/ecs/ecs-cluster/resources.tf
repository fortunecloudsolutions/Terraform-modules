resource "aws_ecs_cluster" "cluster" {
  capacity_providers   = var.capacity_providers
  dynamic "configuration" {
  for_each = var.configuration != null ? [var.configuration] : []    
  content {
    dynamic "execute_command_configuration" {
      for_each = lookup(configuration.value, "execute_command_configuration") !=  null ? [lookup(configuration.value, "execute_command_configuration")]: []
      content {
        kms_key_id             = lookup(execute_command_configuration.value, "kms_key_id")
        dynamic "log_configuration" {
            for_each = lookup(execute_command_configuration.value, "log_configuration") !=  null ? [lookup(execute_command_configuration.value, "log_configuration")]: []
              content {
                  cloud_watch_encryption_enabled = lookup(log_configuration.value, "cloud_watch_encryption_enabled")
                  cloud_watch_log_group_name    = lookup(log_configuration.value, "cloud_watch_log_group_name")
                  s3_bucket_name                = lookup(log_configuration.value, "s3_bucket_name")
                  s3_bucket_encryption_enabled  = lookup(log_configuration.value, "s3_bucket_encryption_enabled")
                  s3_key_prefix                 = lookup(log_configuration.value, "s3_key_prefix")      
              }
        }
        logging    = lookup(execute_command_configuration.value, "logging")
      }
    }    
  }
  }  
  dynamic "default_capacity_provider_strategy" {
  for_each = var.default_capacity_provider_strategy != null ? [var.default_capacity_provider_strategy] : []    
  content {        
    capacity_provider  = lookup(default_capacity_provider_strategy.value, "capacity_provider")
    weight             = lookup(default_capacity_provider_strategy.value, "weight")
    base               = lookup(default_capacity_provider_strategy.value, "base")
  }
  }
  name                 = var.name
  dynamic "setting" {
  for_each = var.setting != null ? [var.setting] : []    
  content {        
    name  = lookup(setting.value, "name")
    value = lookup(setting.value, "value")
  }
  }
  tags    = var.tags
}