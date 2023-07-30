# --- networking/main.tf ---

resource "random_integer" "random" {
  min = 1
  max = 100
}

resource "aws_vpc" "gog_vpc" {
  cidr_block           = var.vpc_cidr
  instance_tenancy     = "default"
  enable_dns_hostnames = true
  enable_dns_support   = true

  tags = {
    Name = "gog-vpc-${random_integer.random.id}"
  }
}

resource "aws_subnet" "gog_public_subnet" {
  count = length(var.public_cidrs)
  vpc_id = aws_vpc.gog_vpc.id
  cidr_block = var.public_cidrs[count.index]
  map_public_ip_on_launch = true
  availability_zone = ["us-west-2a", "us-west-2b", "us-west-2c", "us-west-2d"][count.index]
  
  tags = {
    Name = "gog_public_${count.index + 1}"
  }
}