variable "name" { default = "qa" }

module "vpc" {
  source = "../modules/vpc"

  name = "${var.name}"
}

resource "aws_security_group" "allow" {
  name = "allow"
  vpc_id = "${module.vpc.vpc_id}"

  // allow traffic for TCP 22
  ingress {
      from_port = 22
      to_port = 22
      protocol = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
  }

  tags {
    Name = "${var.name}"
  }
}
