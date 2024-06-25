resource "aws_iam_role" "tf-eks" {
  name = "eks-cluster-tf"
  tags = {
    tag-key = "eks-cluster-tf"
  }

  assume_role_policy = <<POLICY
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Principal": {
                "Service": [
                    "eks.amazonaws.com"
                ]
            },
            "Action": "sts:AssumeRole"
        }
    ]
}
POLICY
}

# eks policy attachment

resource "aws_iam_role_policy_attachment" "tf-eks-AmazonEKSClusterPolicy" {
  role       = aws_iam_role.tf-eks.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy"
}

# bare minimum requirement of eks

resource "aws_eks_cluster" "tf-eks" {
  name     = "tf-eks"
  role_arn = aws_iam_role.tf-eks.arn

  vpc_config {
    subnet_ids = [
      aws_subnet.private-eu-north-1a.id,
      aws_subnet.public-eu-north-1b.id,
      aws_subnet.private-eu-north-1b.id,
      aws_subnet.public-eu-north-1a.id
    ]
  }

  depends_on = [aws_iam_role_policy_attachment.tf-eks-AmazonEKSClusterPolicy]
}