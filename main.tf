// Define the AWS provider and region
provider "aws" {
  region = "ap-south-1"
}

// Create the S3 bucket with public-read ACL
resource "aws_s3_bucket" "bucket" {
  bucket = "circleciterraform2"
  website {
    index_document = "index.html"
  }
}

// Add a policy to the bucket to allow public access
resource "aws_s3_bucket_policy" "bucket_policy" {
  bucket = aws_s3_bucket.bucket.id
  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Sid       = "PublicReadGetObject",
        Effect    = "Allow",
        Principal = "*",
        Action    = ["s3:GetObject"],
        Resource  = ["arn:aws:s3:::${aws_s3_bucket.bucket.id}/*"]
        Principal = "*"
      }
    ]
  })
}
