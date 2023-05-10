variable "location" {
  description = "variável que indica a região onde os recursos serão criados"
  type        = string
  default     = "West Europe"
}


variable "aws_pub_key" {

  description = "public key para vm na AWS"
  type        = string
}

variable "azure_pub_key" {
  description = "public key para vm na azure"
  type        = string
}