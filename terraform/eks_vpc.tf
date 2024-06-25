resource "aws_vpc" "eksvpc" {
  cidr_block = "172.32.0.0/16"
  tags = {
    Name = "eksvpc"
  }
}