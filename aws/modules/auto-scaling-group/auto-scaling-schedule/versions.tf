terraform {
  required_version = ">= 0.13.6"
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