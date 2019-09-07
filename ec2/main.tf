#Variables
variable "ami" { default = "ami-07d0cf3af28718ef8" }
variable "instance_type" { default = "t2.micro" }
variable "instance_count" { default = "1" }
variable "ip_address" { default = "true" }
variable "size" { default = "35" }
variable "name" { default = "udemy" }
variable "environment" { default = "web" }
variable "region" { default = "us-east-1" }
variable "project" { default = "udemy" }

#Resources
resource "aws_instance" "ec2" {
  ami                         = var.ami
  instance_type               = var.instance_type
  count                       = var.instance_count
  associate_public_ip_address = var.ip_address

  root_block_device {
    volume_size = var.size
  }

  tags = {
    Name        = "${var.name}-${count.index + 1}-${var.environment}-${var.project}"
    Region      = var.region
    Count       = var.instance_count
    Timestamp   = "${replace("${timestamp()}", ":", "-")}"
    Project     = var.project
    Environment = var.environment
  }
}

resource "aws_ebs_volume" "new_volume" {
  availability_zone = "${var.region}a"
  size              = 30
  count             = var.instance_count

  tags = {
    Name = "${var.name}-${count.index + 1}-${var.environment}-${var.project}"
  }

  depends_on = ["aws_instance.ec2"]
}

resource "aws_volume_attachment" "new_attach" {
  device_name = "/dev/sdh"
  count       = var.instance_count
  volume_id   = aws_ebs_volume.new_volume[count.index].id
  instance_id = aws_instance.ec2[count.index].id
}

#output
output "region" {
  value = var.region
}
output "ami" {
  value = "${aws_instance.ec2.*.ami}"
}
output "instance_type" {
  value = "${aws_instance.ec2.*.instance_type}"
}
