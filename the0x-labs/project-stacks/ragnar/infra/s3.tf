resource "aws_s3_bucket" "ragnar_bucket" {
    bucket = "ragnar-bucket"
}

resource "aws_s3_bucket_ownership_controls" "ragnar_bucket_ownership_controls" {
    bucket = aws_s3_bucket.ragnar_bucket.bucket
    rule {
        object_ownership = "BucketOwnerPreferred"
    }
}

resource "aws_s3_bucket_public_access_block" "ragnar_bucket_acl" {
    bucket = aws_s3_bucket.ragnar_bucket.bucket
    block_public_acls = true
    block_public_policy = true
    ignore_public_acls = true
    restrict_public_buckets = true
}

resource "aws_s3_bucket_versioning" "ragnar_bucket_versioning" {
    bucket = aws_s3_bucket.ragnar_bucket.bucket
    versioning_configuration {
        status = "Enabled"
    }
}

resource "aws_s3_bucket_policy" "ragnar_bucket_policy" {
    bucket = aws_s3_bucket.ragnar_bucket.id
    policy = jsonencode({
        Version = "2012-10-17",
        Statement = [
            {
                Effect = "Allow",
                Principal = {
                    Service = "lambda.amazonaws.com"
                }
                Action = [
                    "s3:GetObject",
                    "s3:PutObject",
                    "s3:ListBucket"
                ]
                Resource = [
                    "${aws_s3_bucket.ragnar_bucket.arn}",
                    "${aws_s3_bucket.ragnar_bucket.arn}/*"
                ]
            }
        ]
    })
}