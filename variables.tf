# variables.tf

variable "aws_region" {
  default = "ap-northeast-2"
}

variable "aws_access_key" {}
variable "aws_secret_key" {}

variable "key_pair_name" {
  default = "terraform-key"
}

variable "public_key_path" {
  default = "~/.ssh/terraform-key.pub"
}

variable "ami_id" {
  default = "ami-0e001c9271cf7f3b9" # Ubuntu 22.04 LTS (¼­¿ï)
}

variable "instance_type" {
  default = "t2.micro"
}

