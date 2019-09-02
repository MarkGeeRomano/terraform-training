variable "name" { default =  "ami-07d0cf3af28718ef8" }
variable "instance" { default = "t2.micro" }

resource "aws_instance" "test_instance" {
  ami = "${var.name}"
  instance_type = "${var.instance}"
  tags = {
    Name = "myFirstInstance"
  }
}
