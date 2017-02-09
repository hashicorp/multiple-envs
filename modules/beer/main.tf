
variable "name" { }
variable "foo" { }

resource "random_id" "beer1" {
  tags = {
    Env = "${var.name}" 
    Foo = "${var.foo}"
  }
  byte_length = 8
}
