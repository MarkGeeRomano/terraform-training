module "instance" {
  source = "../../ec2"
  name = "NOT_udemy"
  instance_count = 2
  project = "test_project"
  environment = "production"
}