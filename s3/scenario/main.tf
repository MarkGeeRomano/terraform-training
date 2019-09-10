resource "aws_s3_bucket" "bucket" {
  acl           = "private"
  bucket        = "udemy-bucket-mgr"
  force_destroy = false

  versioning {
    enabled = true
  }

  tags = {
    Name = "udemy-bucket-mgr"
  }

  logging {
    target_bucket = aws_s3_bucket.logs_bucket.id
    target_prefix = "log/"
  }
}

resource "aws_s3_bucket" "logs_bucket" {
  bucket = "udemy-loggin-bucket-mgr"
  acl    = "log-delivery-write"
}
