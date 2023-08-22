provider "aws" {
  version = "5.13.1"
  region = "eu-central-1"
}

resource "aws_instance" "dev" {  
  count = 3
  ami = "t3.micro"
  instance_type = "tf014"
  key_name = "nome-da-chave"

  tags = {
    Name = "dev-${count.index}"
  }

  vpc_security_group_ids = ["sg-xxxxxxxxxxxx"]

}

resource "aws_security_group" "acesso-ssh" {
  name        = "acesso-ssh"
  description = "acesso-ssh"
  
  ingress {   
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]   
  }

  tags = {
    Name = "ssh"
  }
}

resource "aws_instance" "nome-do-instance-dev" {    
  ami = "t3.micro"
  instance_type = "tf014"
  key_name = "nome-da-chave"

  tags = {
    Name = "nome-do-instance-dev"
  }

  vpc_security_group_ids = ["sg-xxxxxxxxxxxx"]
  depends_on = [aws_s3_bucket.nome-do-bucket-dev]

}

resource "aws_s3_bucket" "nome-do-bucket-dev" {
  bucket = "nome-do-bucket-dev" 
  acl    = "private"
  tags   = {      
    Name        = "My bucket"
    Environment = "Dev"      
  }
}