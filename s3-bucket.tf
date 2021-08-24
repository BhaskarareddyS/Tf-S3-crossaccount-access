
## Source S3 bucket setup 

resource "aws_s3_bucket" "source-s3" {
  bucket = "source-tf-test-bucket"
  acl    = "private"

  tags = {
    Name        = "source-s3"
    Environment = "devlop"
  }
}

resource "aws_s3_bucket_policy" "s3-policy" {
  bucket = aws_s3_bucket.source-s3.id

  policy = jsonencode({
    {
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "DelegateS3Access",
            "Effect": "Allow",
            "Principal": {"AWS": "222222222222"},
            "Action": ["s3:ListBucket","s3:GetObject"],
            "Resource": [
                "arn:aws:s3:::source-tf-test-bucket/*",
                "arn:aws:s3:::source-tf-test-bucket"
            ]
        }
    ]
})

}

## Target S3 bucket setup 


resource "aws_s3_bucket" "target-s3" {
  bucket = "target-tf-test-bucket"
  acl    = "private"

  tags = {
    Name        = "My bucket"
    Environment = "Dev"
  }
}