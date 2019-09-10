#data
data "aws_availability_zones" "all" {}
#sec grp
resource "aws_security_group" "instance" {
  name = "tf_example_instance"
  ingress {
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_launch_configuration" "example" {
  image_id        = "ami-07d0cf3af28718ef8"
  instance_type   = "t2.micro"
  security_groups = [aws_security_group.instance.id]
  user_data       = <<EOF
    #!/bin/bash
    sudo apt-get -y update
    sudo apt-get -y install nginx
    ebs_optimized
    EOF

  lifecycle {
    create_before_destroy = true
  }
}


#launch config
#asg
resource "aws_autoscaling_group" "example" {
  launch_configuration = aws_launch_configuration.example.id
  availability_zones = ["${data.aws_availability_zones.all.names[0]}"]
  health_check_grace_period = 300
  min_size = 2 
  max_size = 5
  tag {
    key = "Name"
    value = "autoscale"
    propagate_at_launch = true
  }
}

#schedule
