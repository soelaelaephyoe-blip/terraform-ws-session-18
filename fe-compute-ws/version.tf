terraform {
  required_version = ">= v1.16.6"
  cloud {
    organization = "soe-hands-on-tf"
    hostname     = "app.terraform.io"

    workspaces {
      name = "fe-compute-ws"
    }
  }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 6.69.1"
    }
  }
}
provider "aws" {
  region = "ap-northeast-1"
}

