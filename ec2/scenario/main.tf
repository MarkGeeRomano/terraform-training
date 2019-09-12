locals {
  time = "${replace("${timestamp()}", ":", "-")}"
}
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
    Timestamp   =  local.time
    Project     = var.project
    Environment = var.environment
  }
}

resource "null_resource" "instance_count" {
  triggers {
    disk_size = aws_instance.ec2.count
  }
}

provisioner "local_exec" {
  command = "echo YELLLLLOWWWWWWW"
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
output "external_ip" {
  value = "${aws_instance.ec2.*.associate_public_ip_address}"
}
