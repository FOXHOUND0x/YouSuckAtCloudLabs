resource "aws_eks_cluster" "example" {
  name     = "example-cluster"
  role_arn = "arn:aws:iam::123456789012:role/eks-cluster-role"
  version  = "1.21"
  vpc_config {
    subnet_ids = ["subnet-12345678", "subnet-87654321"]
  }
}
