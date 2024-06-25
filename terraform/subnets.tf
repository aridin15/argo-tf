resource "aws_subnet" "private-eu-north-1a" {
  vpc_id            = aws_vpc.eksvpc.id
  cidr_block        = "172.32.0.0/24"
  availability_zone = "eu-north-1a"

  tags = {
    Name                              = "private-eu-north-1a"
    "kubernetes.io/role/internal-elb" = "1"
    "kubernetes.io/cluster/tf-eks"    = "owned"
  }
}

resource "aws_subnet" "public-eu-north-1b" {
  vpc_id            = aws_vpc.eksvpc.id
  cidr_block        = "172.32.1.0/24"
  availability_zone = "eu-north-1b"

  tags = {
    Name                           = "public-eu-north-1b"
    "kubernetes.io/role/elb"       = "1" #this instruct the kubernetes to create public load balancer in these subnets
    "kubernetes.io/cluster/tf-eks" = "owned"
  }
}

resource "aws_subnet" "private-eu-north-1b" {
  vpc_id            = aws_vpc.eksvpc.id
  cidr_block        = "172.32.2.0/24"
  availability_zone = "eu-north-1b"

  tags = {
    Name                              = "private-eu-north-1b"
    "kubernetes.io/role/internal-elb" = "1"
    "kubernetes.io/cluster/tf-eks"    = "owned"
  }
}

resource "aws_subnet" "public-eu-north-1a" {
  vpc_id            = aws_vpc.eksvpc.id
  cidr_block        = "172.32.3.0/24"
  availability_zone = "eu-north-1a"

  tags = {
    Name                           = "public-eu-north-1a"
    "kubernetes.io/role/elb"       = "1" #this instruct the kubernetes to create public load balancer in these subnets
    "kubernetes.io/cluster/tf-eks" = "owned"
  }
}