resource "aws_s3_bucket" "remote_state" {
  bucket = "mark-udemy-remote-state"

  versioning {
    enabled = true
  }
  
  tags = {
    Name = "mark-udemy-remote-state"
  }
}
