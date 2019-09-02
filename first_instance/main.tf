resource "aws_instance" "first_instance" {
  ami = var.env == "prod" ? var.prod_ami : var.dev_ami
  instance_type = "${var.instance}"
  tags = {
    Name = "myFirstInstance"
  }
}
# output "instance" {
#   value = aws_instance.test_instance.*.tags.Name
# }
# output "instance_type" {
#   value = aws_instance.test_instance.*.instance_type
# }
# output "instance_id" {
#   value = "${join(",",aws_instance.test_instance.*.id)}"
# }
