provider "vault" {
  address               = var.vault_addr
  token                 = var.vault_token
  max_lease_ttl_seconds = var.lease_seconds
}

data "vault_aws_access_credentials" "creds" {
  backend = var.backend
  role    = var.role
}
provider "aws" {
  region     = var.region
  access_key = data.vault_aws_access_credentials.creds.access_key
  secret_key = data.vault_aws_access_credentials.creds.secret_key
}


module "s3_role" {
  source = "../../../../modules/iam/iam-role"

  role_policy = var.role_policy

  tags = { "Name" : "s3-role" }
}
data "aws_iam_policy_document" "bucket_policy" {
  statement {
    principals {
      type        = "AWS"
      identifiers = [module.s3_role.role_arn]
    }

    actions = var.actions

    resources = [
      "arn:aws:s3:::${var.bucket_name}",
    ]
  }
}
module "log_bucket" {
  source = "../../../../modules/volumes/s3/s3-create-bucket"

  bucket        = "logs-${var.bucket_name}"
  acl           = "log-delivery-write"
  force_destroy = var.force_destroy
  #attach_elb_log_delivery_policy = var.attach_policy

}

module "s3_bucket" {
  source = "../../../../modules/volumes/s3/s3-create-bucket"

  bucket        = var.bucket_name
  acl           = var.acl
  force_destroy = var.force_destroy

  attach_policy = var.attach_policy
  #policy        = data.aws_iam_policy_document.bucket_policy.json

  tags = var.tags

  versioning = var.versioning

  website = var.website

  logging = {
    target_bucket = module.log_bucket.this_s3_bucket_id
    target_prefix = var.target_prefix
  }

  cors_rule = var.cors_rule



  server_side_encryption_configuration = {
    rule = {
      apply_server_side_encryption_by_default = {
        #kms_master_key_id = aws_kms_key.objects.arn
        sse_algorithm = var.sse_algorithm
      }
    }
  }

  object_lock_configuration = {
    /*object_lock_enabled = "Disabled"
    rule = {
      default_retention = {
        mode  = "COMPLIANCE"
        years = 5
      }
    }*/
  }


}

// S3 bucket-level Public Access Block configuration
module "s3_bucket_public_access_block" {
  source                  = "../../../../modules/volumes/s3/s3-bucket-level-public-access"
  bucket_name             = var.bucket_name
  block_public_acls       = var.block_public_acls
  block_public_policy     = var.block_public_policy
  ignore_public_acls      = var.ignore_public_acls
  restrict_public_buckets = var.restrict_public_buckets
  depends_on              = [module.s3_bucket, module.s3_bucket_policy]
}

// S3 Bucket Policy

module "s3_bucket_policy" {
  source                         = "../../../../modules/volumes/s3/s3-bucket-policy"
  bucket_name                    = var.bucket_name
  attach_elb_log_delivery_policy = var.attach_policy
  policy                         = data.aws_iam_policy_document.bucket_policy.json
  depends_on                     = [module.s3_bucket]
}
