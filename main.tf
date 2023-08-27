provider "aws" {
  region = "ap-southeast-1" # Change to your region
}

resource "aws_s3_bucket" "circleciterraform" {
  bucket = "circleciterraform" # Change to your unique bucket name
  acl    = "public-read"

  website {
    index_document = "index.html"
  }
}
