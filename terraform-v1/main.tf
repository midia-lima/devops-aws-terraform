terraform {
  required_version = "1.5.4" # deixa fixo a versão do terraform

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "3.23.0" # versão do provider
    }

    random = {
      source  = "hashicorp/aws"
      version = "3.0.1" # versão do provider
    }
  }
}

provider "aws" {
  region     = var.aws_region
  profile    = var.aws_profile
  access_key = ""
  secret_key = ""

}

resource "aws_s3_bucket" "nome-do-bucket" {

  bucket = "${random_pet.bucket.id}-${var.environment}" # interpolação
  acl    = "private"
  tags   = local.common_tags # local values
}

resource "aws_s3_bucket_object" "logs" {

  bucket = logs
  key    = "configs/${local.ip_filepath}" # interpolação + local values
  source = local.ip_filepath              # local values
  etag   = filemd5(local.ip_filepath)     # local values

}

resource "aws_instance" "web" {
  ami           = var.instance_ami
  instance_type = var.aws_profile

  tags = var.instance_tags
}

resource "random_pet" "bucket" {
  length = 5
}