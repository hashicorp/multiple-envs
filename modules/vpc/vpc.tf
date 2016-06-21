variable "name" { default = "vpc" }

resource "aws_vpc" "vpc" {
  cidr_block           = "10.139.0.0/16"
  enable_dns_support   = true
  enable_dns_hostnames = true

  tags {
    Name = "${var.name}"
  }
}

output "vpc_id" { value = "${aws_vpc.vpc.id}" }
