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

}

resource "aws_security_group" "acesso-ssh" {
  name        = "acesso-ssh"
  description = "acesso-ssh"
  vpc_id      = aws_vpc.main.id

  ingress {
    description      = "TLS from VPC"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = [aws_vpc.main.cidr_block]
    ipv6_cidr_blocks = [aws_vpc.main.ipv6_cidr_block]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "ssh"
  }
}