variable "environment" {
  type        = string
  description = ""
}

variable "aws_region" {
  type        = string
  description = ""
  default     = "eu-central-1"
}

variable "aws_profile" {
  type        = string
  description = ""
  default     = "tf014"
}

variable "instance_ami" {
  type        = string
  description = ""
  default     = "t3.micro"
}

variable "instance_type" {
  type        = string
  description = ""
}

variable "instance_tags" {
  type        = map(string)
  description = ""
  default = {
    Name    = "Umbutu"
    Project = "Curso AWS"
  }
}

