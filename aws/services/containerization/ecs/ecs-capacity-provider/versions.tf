terraform {
  required_version = ">= 1.3.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "<=4.44.0"

    }
    vault = {
      source  = "hashicorp/vault"
      version = "<=2.19.0"
    }
  }
}