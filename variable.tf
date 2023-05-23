variable "ssm-name" {
  type = string
}

variable "ssm-key" {
  type = list
}

variable "ssm-values" {
  type = list
}

variable "aws-region" {
  type=string
  default = "eu-west-2"
}