provider "aws" {
  region = "us-west-2"
}

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
  cloud {

    organization = "DustyCloudNinja"

    workspaces {
      name = "TheDustCloud"
    }
  }
}

