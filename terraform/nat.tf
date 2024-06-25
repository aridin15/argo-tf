resource "aws_eip" "nat" {
  vpc = true

  tags = {
    Name = "nat"
  }
}

resource "aws_nat_gateway" "eks-nat" {
  allocation_id = aws_eip.nat.id
  subnet_id     = aws_subnet.public-eu-north-1b.id

  tags = {
    Name = "eks-nat"
  }

  depends_on = [aws_internet_gateway.eksvpc-igw]
}