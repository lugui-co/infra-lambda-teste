variable "vpc_id" {
  type = string
  description = "VPC Id"
}

variable "app_subnets" {
  type        = list(string)
  description = "List of private Subnets"
}