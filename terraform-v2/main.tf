## Providers

provider "aws" {
  version = "5.13.1"
  region  = "us-east-1"
}

provider "aws" {
  alias   = "us-east-2"
  version = "5.13.1"
  region  = "us-east-2"
}

## Instancias

resource "aws_instance" "dev" {
  count         = 3
  ami           = var.amis[us-east-2]
  instance_type = "t3.medium"
  key_name      = var.nome-da-chave

  tags = {
    Name = "dev-${count.index}"
  }

  vpc_security_group_ids = ["sg-xxxxxxxxxxxx"]

}

resource "aws_instance" "dev-4" {
  ami           = "ami-07b14488da8ea02a0"
  instance_type = "t3.medium"
  key_name      = var.nome-da-chave

  tags = {
    Name = "dev-4"
  }

  vpc_security_group_ids = ["sg-xxxxxxxxxxxx"]
  depends_on             = ["aws_s3_bucket.nome-do-bucket-dev"]

}

resource "aws_instance" "dev-5" {
  provider      = "aws.us-east-2"
  ami           = var.amis[us-east-2]
  instance_type = "t3.medium"
  key_name      = var.nome-da-chave

  tags = {
    Name = "dev-5"
  }

  vpc_security_group_ids = ["${aws_security_group.acesso-ssh-us-east-2.id}"]

}

resource "aws_instance" "dev-6" {
  provider      = "aws.us-east-2"
  ami           = "ami-07b14488da8ea02a0"
  instance_type = "t3.medium"
  key_name      = var.nome-da-chave

  tags = {
    Name = "dev-6"
  }

  vpc_security_group_ids = ["${aws_security_group.acesso-ssh-us-east-2.id}"]
  depends_on             = ["aws_dynamodb_table.dynamodb-series-homologacao"]

}


## Bucket 

resource "aws_s3_bucket" "nome-do-bucket-dev" {
  bucket = "nome-do-bucket-dev"
  acl    = "private"
  tags = {
    Name        = "My bucket"
    Environment = "Dev"
  }
}

## DynamoDB

resource "aws_dynamodb_table" "dynamodb-series-homologacao" {
  provider     = "aws.us-east-2"
  name         = "GameScores"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "UserId"
  range_key    = "GameTitle"

  attribute {
    name = "UserId"
    type = "S"
  }

  attribute {
    name = "GameTitle"
    type = "S"
  }
}
