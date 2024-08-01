resource "aws_s3_bucket" "example" {
  bucket = "example-bucket"

  website {
    index_document = "index.html"  # Index document configured, indicating a website is hosted
  }
}
