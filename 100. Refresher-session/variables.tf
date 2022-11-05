variable "bucket" {
  default = "soso-23456789"
}


variable "tags" {
  default = {
    Name        = "My bucket"
    Environment = "Dev"
  }
}

variable "storage" {
  default = 10
}