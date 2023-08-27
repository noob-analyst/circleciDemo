provider "aws" {
  region = "ap-southeast-1" # Change to your region
}

resource "aws_s3_bucket" "circleciterraform"{
  bucket = "circleciterraform2" # Change to your unique bucket name

  website {
    index_document = "index.html"
  }
}
