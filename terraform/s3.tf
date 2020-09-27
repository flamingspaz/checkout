resource "aws_s3_bucket" "app" {
  bucket = "example.com"
  acl    = "public-read"

  website {
    index_document = "index.html"
    error_document = "error.html"
  }
}
