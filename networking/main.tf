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