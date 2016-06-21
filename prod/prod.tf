variable "name" { default = "prod" }
variable "cidr" { default = "10.139.0.0/16" }

module "vpc" {
  source = "../modules/vpc"

  name = "${var.name}"
  cidr = "${var.cidr}"
}

output "vpc_cidr" {
  value = "${module.vpc.vpc_cidr}"
}
