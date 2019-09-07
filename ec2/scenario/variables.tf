#Variables
variable "ami" { default = "ami-05c1fa8df71875112" }
variable "instance_type" { default = "t2.micro" }
variable "instance_count" { default = "3" }
variable "ip_address" { default = "true" }
variable "size" { default = "35" }
variable "name" { default = "udemy" }
variable "environment" { default = "web" }
variable "region" { default = "us-east-2" }
variable "project" { default = "udemy" }