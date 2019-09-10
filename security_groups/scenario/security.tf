resource "aws_security_group" "group_1" {
  name = "our_group"
  tags = {
    name = "our_group"
  }
}

resource "aws_security_group_rule" "single" {
  type = "ingress"
  from_port = "22"
  to_port = "22"
  protocol = "tcp"
  cidr_blocks = ["0.0.0.0/0"]
  security_group_id = aws_security_group.group_1.id
}

resource "aws_security_group_rule" "range" {
  type = "ingress"
  from_port = "1000"
  to_port = "10005"
  protocol = "tcp"
  cidr_blocks = ["0.0.0.0/0"]
  security_group_id = aws_security_group.group_1.id
}

resource "aws_security_group" "scenario" {
  name = "scenario"
  tags = {
    name = "scenario"
  }
}

resource "aws_security_group_rule" "single_scenario_1" {
  type = "ingress"
  from_port = "8080"
  to_port = "8080"
  protocol = "tcp"
  cidr_blocks = ["0.0.0.0/0"]
  security_group_id = aws_security_group.scenario.id
}

resource "aws_security_group_rule" "single_scenario_2" {
  type = "ingress"
  from_port = "443"
  to_port = "443"
  protocol = "tcp"
  cidr_blocks = ["0.0.0.0/0"]
  security_group_id = aws_security_group.scenario.id
}

resource "aws_security_group_rule" "range_scenario_2" {
  type = "ingress"
  from_port = "998"
  to_port = "999"
  protocol = "tcp"
  cidr_blocks = ["0.0.0.0/0"]
  security_group_id = aws_security_group.scenario.id
}