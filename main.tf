terraform {
  required_version = "1.5.4" # deixa fixo a versão do terraform

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "3.23.0" # versão do provider
    }
  }
}

provider "aws" {
  region     = var.aws_region
  profile    = var.aws_profile
  access_key = ""
  secret_key = ""

}

resource "aws_s3_bucket" "nome-do-bucket-recurso" {
  bucket = "nome-do-bucket"
  acl    = "private"

  tags = {
    Name        = "My bucket"
    Environment = "Dev"
    Managedby   = "Terraform"
    Owner       = "Midiã Lima"
    UpdateAt    = "2023-07-28"
  }
}

resource "aws_instance" "web" {
  ami           = var.instance_ami
  instance_type = var.aws_profile

  tags = var.instance_tags
}