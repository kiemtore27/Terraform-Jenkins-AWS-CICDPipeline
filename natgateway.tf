# Allocate Elastic IP for NAT Gateway in public subnet AZ1
resource "aws_eip" "eip_for_nat_gateway_az1" {
  vpc = true

  tags = {
    Name = "nat-gateway-az1-eip"
  }
}

# Allocate Elastic IP for NAT Gateway in public subnet AZ2
resource "aws_eip" "eip_for_nat_gateway_az2" {
  vpc = true

  tags = {
    Name = "nat-gateway-az2-eip"
  }
}

# Create NAT Gateway in public subnet AZ1
resource "aws_nat_gateway" "nat_gateway_az1" {
  allocation_id = aws_eip.eip_for_nat_gateway_az1.id
  subnet_id     = aws_subnet.public_subnet_az1.id

  tags = {
    Name = "nat-gateway-az1"
  }

  depends_on = [aws_internet_gateway.internet_gateway]
}

# Create NAT Gateway in public subnet AZ2
resource "aws_nat_gateway" "nat_gateway_az2" {
  allocation_id = aws_eip.eip_for_nat_gateway_az2.id
  subnet_id     = aws_subnet.public_subnet_az2.id

  tags = {
    Name = "nat-gateway-az2"
  }

  depends_on = [aws_internet_gateway.internet_gateway]
}

# Create private route table for AZ1 and add route through NAT Gateway AZ1
resource "aws_route_table" "private_route_table_az1" {
  vpc_id = aws_vpc.vpc.id

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.nat_gateway_az1.id
  }

  tags = {
    Name = "private-route-table-az1"
  }
}

# Associate private app subnet AZ1 with private route table AZ1
resource "aws_route_table_association" "private_app_subnet_az1_association" {
  subnet_id      = aws_subnet.private_app_subnet_az1.id
  route_table_id = aws_route_table.private_route_table_az1.id
}

# Associate private data subnet AZ1 with private route table AZ1
resource "aws_route_table_association" "private_data_subnet_az1_association" {
  subnet_id      = aws_subnet.private_data_subnet_az1.id
  route_table_id = aws_route_table.private_route_table_az1.id
}

# Create private route table for AZ2 and add route through NAT Gateway AZ2
resource "aws_route_table" "private_route_table_az2" {
  vpc_id = aws_vpc.vpc.id

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.nat_gateway_az2.id
  }

  tags = {
    Name = "private-route-table-az2"
  }
}

# Associate private app subnet AZ2 with private route table AZ2
resource "aws_route_table_association" "private_app_subnet_az2_association" {
  subnet_id      = aws_subnet.private_app_subnet_az2.id
  route_table_id = aws_route_table.private_route_table_az2.id
}

# Associate private data subnet AZ2 with private route table AZ2
resource "aws_route_table_association" "private_data_subnet_az2_association" {
  subnet_id      = aws_subnet.private_data_subnet_az2.id
  route_table_id = aws_route_table.private_route_table_az2.id
}


  
  


