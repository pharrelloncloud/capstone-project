variable "aws_region" {
  default = "eu-west-2"
}

variable "ami_id" {
  description = "Ubuntu 22.04 AMI"
  type        = string
}

variable "key_name" {
  description = "EC2 SSH key name"
  type        = string
}
