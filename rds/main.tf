resource "aws_db_instance" "db" {
  name                       = "my_db"
  identifier                 = "my-db"
  engine                     = "mysql"
  engine_version             = "5.7"
  instance_class             = "db.t3.medium"
  allocated_storage          = 20
  storage_type               = "standard"
  storage_encrypted          = true
  username                   = "test1"
  password                   = "123456test"
  multi_az                   = false
  apply_immediately          = true
  maintenance_window         = "mon:04:00-mon:04:30"
  backup_window              = "02:00-02:30"
  backup_retention_period    = 1
  skip_final_snapshot        = false
  final_snapshot_identifier  = "my-db"
  parameter_group_name       = "default.mysql5.7"
  copy_tags_to_snapshot      = true
  auto_minor_version_upgrade = false

  tags = {
    name       = "my_db"
    identifier = "my_db"
    engine     = "mysql"
  }
}
