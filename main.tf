# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

variable "name" { default = "REPLACE_ME" }
variable "cidr" { default = "10.139.0.0/16" }

module "network" {
  source = "modules/network"

  name = "${var.name}"
  cidr = "${var.cidr}"
}

output "env"      { value = "${var.name}" }
output "vpc_cidr" { value = "${module.network.vpc_cidr}" }
