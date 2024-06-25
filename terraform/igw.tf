resource "aws_internet_gateway" "eksvpc-igw" {
  vpc_id = aws_vpc.eksvpc.id

  tags = {
    Name = "eksvpc-igw"
  }
}