resource "aws_s3_bucket_policy" "the0x_demo" {
    bucket = aws_s3_bucket.the0x_demo.bucket
    policy = jsonencode({
        Version = "2012-10-17"
        Statement = [
            {
                Effect = "Allow"
                Principal = {
                    Service = "ec2.amazonaws.com"
                },
                Action = "s3:*"
                Resource = [
                    "${aws_s3_bucket.the0x_demo.arn}",
                    "${aws_s3_bucket.the0x_demo.arn}/*"
                ]
            }
        ]
    })
}

resource "aws_iam_instance_profile" "the0x_demo" {
    name = "the0x_demo"
    role = aws_iam_role.the0x_demo.name
}

resource "aws_iam_role" "the0x_demo" {
    name = "the0x_demo"
    assume_role_policy = jsonencode({
        Version = "2012-10-17"
        Statement = [
            {
                Effect = "Allow"
                Principal = {
                    Service = "ec2.amazonaws.com"
                }
                Action = "sts:AssumeRole"
            }
        ]
    })
}

resource "aws_iam_role_policy" "the0x_demo" {
    name = "the0x_demo"
    role = aws_iam_role.the0x_demo.id
    policy = jsonencode({
        Version = "2012-10-17"
        Statement = [
            {
                Effect = "Allow"
                Action = [
                    "s3:*"
                ]
                Resource = [
                    "${aws_s3_bucket.the0x_demo.arn}",
                    "${aws_s3_bucket.the0x_demo.arn}/*"
                ]
            }
        ]
    })
}
