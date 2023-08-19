# local values
locals {

  ip_filepath = "ips.json"

  common_tags = {
    Name        = "My bucket"
    Environment = "Dev"
    Managedby   = "Terraform"
    Owner       = "Midiã Lima"
    UpdateAt    = "2023-07-28"
  }
}

