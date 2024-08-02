resource "aws_s3_bucket" "the0x_demo" {
    bucket = "the0x-demos"
    tags = {
        Name = "the0x-demos"
    }
}

resource "aws_security_group" "the0x_demo" {
    name = "the0x_demo"
    vpc_id = data.aws_vpc.default.id
    ingress {
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = [local.my_ip_cidr]
    }
    egress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }
}

resource "aws_instance" "the0x_demo" {
    ami = "ami-00beae93a2d981137"
    instance_type = "t2.micro"
    security_groups = [aws_security_group.the0x_demo.name]
    tags = {
        Name = "the0x-demo"
    }
    key_name = aws_key_pair.generated_key.key_name
    iam_instance_profile = aws_iam_instance_profile.the0x_demo.name
    metadata_options {
        http_tokens = "required"
    }

    user_data = <<-EOF
        #!/bin/bash
        echo "Hello, From Instance # 1" > /tmp/hello.txt
        aws s3 cp /tmp/hello.txt s3://${aws_s3_bucket.the0x_demo.bucket}/hello-instance-one.txt
    EOF
}

resource "aws_instance" "the0x_demo_mounted" {
    ami = "ami-00beae93a2d981137"
    instance_type = "t2.micro"
    security_groups = [aws_security_group.the0x_demo.name]
    tags = {
        Name = "the0x-demo-mounted"
    }
    key_name = aws_key_pair.generated_key.key_name
    iam_instance_profile = aws_iam_instance_profile.the0x_demo.name
    metadata_options {
        http_tokens = "required"
    }

    user_data = <<-EOF
        #!/bin/bash
        wget https://s3.amazonaws.com/mountpoint-s3-release/latest/x86_64/mount-s3.rpm
        sudo yum install ./mount-s3.rpm -y
        mount-s3 --version > /tmp/mount-s3-version.txt
        mkdir /ec2-user/mnt
        mount-s3 the0x-demos ./
    EOF
}


