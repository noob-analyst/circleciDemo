provider "aws" {
  region = "ap-southeast-1" # Change to your desired AWS region
}

resource "aws_s3_bucket" "circleciterraform2" {
  bucket = "circleciterraform2" # Change to your unique bucket name

  website {
    index_document = "index.html"
  }
}

resource "aws_s3_bucket_policy" "circleciterraform_policy" {
  bucket = aws_s3_bucket.circleciterraform2.id

  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Action = [
          "s3:GetObject",
          "s3:PutBucketPolicy"
        ],
        Effect = "Allow",
        Resource = [
          "arn:aws:s3:::circleciterraform2",
          "arn:aws:s3:::circleciterraform2/*"
      ],
        Principal = "*",
      },
    ],
  })
}
