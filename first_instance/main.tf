resource "aws_instance" "test_instance" {
  ami = "${var.name}"
  instance_type = "${var.instance}"
  count = "${length(var.name_count)}"
  tags = {
    Name = "myFirstInstance"
  }
}

output "instance" {
  value = aws_instance.test_instance.*.ami
}
output "instance_type" {
  value = aws_instance.test_instance.*.instance_type
}
