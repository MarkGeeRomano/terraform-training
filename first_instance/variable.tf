variable "ami_value" { 
  type = "map"
  default =  {
    us_east_1 = "ami-07d0cf3af28718ef8" 
  }
}
variable "instance" { default = "t2.micro" }
variable "name_count" { default = ["s1", "s2", "s3"] }
variable "env" { default = "dev" }
variable "prod_ami" { default = "ami-07d0cf3af28718ef8" }
variable "dev_ami" { default = "ami-0b898040803850657" }