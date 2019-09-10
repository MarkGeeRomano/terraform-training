resource "aws_s3_bucket" "bucket" {
  acl = "private"
  bucket = "udemy-bucket-mgr"
  force_destroy = false

  versioning {
    enabled = true
  }

  tags = {
    Name = "udemy-bucket-mgr"
  }
}
