resource "aws_s3_bucket" "static_files" {
  bucket_prefix = "static-files-"
  acl           = "private"
}