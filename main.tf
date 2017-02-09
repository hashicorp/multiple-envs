variable "name" { default = "REPLACE_ME" }
variable "foo" { default = "REPLACE_ME" }

module "beer" {
  source = "modules/beer"

  name = "${var.name}"
  foo = "${var.foo}"
}

output "env"      { value = "${var.name}" }
output "foo" { value = "${module.beer.foo}" }
