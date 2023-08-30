variable "amis" {
  type = map(string)
  default = {
    "us-east-1" = "ami-07b14488da8ea02a0"
    "us-east-2" = "ami-03c3a7e4263fd998c"
  }

}

variable "cdirs_acesso_remoto" {
  type    = list(string)
  default = ["0.0.0.0/0"]
}

variable "nome-da-chave" {
  default = "nome-da-chave"
}