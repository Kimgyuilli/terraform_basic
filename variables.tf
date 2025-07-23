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
  default = "ami-04cebc8d6c4f297a3" # Ubuntu 22.04 LTS (Seoul)
}

variable "instance_type" {
  default = "t2.micro"
}

