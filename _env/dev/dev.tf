variable "name" { default = "demo-dev" }
variable "cidr" { default = "10.139.0.0/16" }

module "network" {
  source = "../../modules/network"

  name = "${var.name}"
  cidr = "${var.cidr}"
}

output "env"      { value = "${var.name}" }
output "vpc_cidr" { value = "${module.network.vpc_cidr}" }
