#Variables
variable "ami" { default = "ami-07d0cf3af28718ef8" }
variable "instance_type" { default = "t2.micro" }
variable "volume_count" { default = "2" }
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
  associate_public_ip_address = var.ip_address
  security_groups = [aws_security_group.group.name]

  root_block_device {
    volume_size = var.size
  }

  tags = {
    Name        = "${var.name}-${var.environment}-${var.project}"
    Region      = var.region
    Timestamp   = "${replace("${timestamp()}", ":", "-")}"
    Project     = var.project
    Environment = var.environment
  }
}

resource "aws_ebs_volume" "new_volume_1" {
  availability_zone = "${var.region}a"
  size              = 30

  tags = {
    Name = "${var.name}-${var.environment}-${var.project}-1"
  }

  depends_on = ["aws_instance.ec2"]
}

resource "aws_ebs_volume" "new_volume_2" {
  availability_zone = "${var.region}a"
  size              = 30

  tags = {
    Name = "${var.name}-${var.environment}-${var.project}-2"
  }

  depends_on = ["aws_instance.ec2"]
}

resource "aws_volume_attachment" "new_attach_1" {
  device_name = "/dev/sdh"
  volume_id   = aws_ebs_volume.new_volume_1.id
  instance_id = aws_instance.ec2.id
}

resource "aws_volume_attachment" "new_attach_2" {
  device_name = "/dev/sdi"
  volume_id   = aws_ebs_volume.new_volume_2.id
  instance_id = aws_instance.ec2.id
}

#output
output "region" {
  value = var.region
}
output "ami" {
  value = "${aws_instance.ec2.ami}"
}
output "instance_type" {
  value = "${aws_instance.ec2.instance_type}"
}
