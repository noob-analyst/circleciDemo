// Define the AWS provider and region
provider "aws" {
  region = "ap-southeast-1"
}

// Create the S3 bucket with public-read ACL
resource "aws_s3_bucket" "bucket" {
  bucket = "circleciterraform2"
  website {
    index_document = "index.html"
  }
}

// Define IAM policy document for public read access
data "aws_iam_policy_document" "public_read_access" {
  statement {
    effect = "Allow"
    principals {
      type = "AWS"
      identifiers = ["*"]
    }

    actions = ["s3:GetObject"]

    resources = [
      "${aws_s3_bucket.bucket.arn}/*"
    ]
  }
}


// Add a policy to the bucket to allow public access
resource "aws_s3_bucket_policy" "bucket_policy" {
  bucket = aws_s3_bucket.bucket.id
  policy = data.aws_iam_policy_document.public_read_access.json
}
