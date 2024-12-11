terraform {
    required_providers {
        aws = {
            source = "hashicorp/aws"
            version = "~> 5.80.0"
        }
    }

    backend "s3" {
        key = "terraform.tfstate"
        workspace_key_prefix = "infra/backend/lambda-teste"
    }
}

provider "aws" {
    default_tags {
        tags = {
            team = "AI"
            terraform = "true"
            environment = terraform.workspace
        }
    }
}

data "aws_region" "region" {}

data "aws_caller_identity" "current" {}

variable "tags" {
    default     = {}
    type        = map(string)
    description = "Extra tags to attach to main resources"
}