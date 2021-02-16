resource "aws_route_table" "projectPublicRouteTable" {
  vpc_id = aws_vpc.finalproject-VPC.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.finalproject-IGW.id
  }
  tags = {
    Name = "${var.servicename}-Public-RouteTable"
  }

}

resource "aws_route_table_association" "project-Pulic-RT-Association" {
  subnet_id      = aws_subnet.finalprojectPublicSubnet1.id
  route_table_id = aws_route_table.projectPublicRouteTable.id
}


resource "aws_network_interface" "project-NetworkInterface" {
  subnet_id = aws_subnet.finalprojectPublicSubnet1.id
}

resource "aws_route_table" "VotingSubneta" {
  vpc_id = aws_vpc.finalproject-VPC.id
  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.finalproject-NGW.id
  }
  tags = {
    Name = "Voting Subnet A"
  }
}
resource "aws_route_table_association" "VotingSubneta" {
  route_table_id = aws_route_table.VotingSubneta.id
  subnet_id      = aws_subnet.Subnet_App1.id
}

resource "aws_route_table" "RedisSubneta" {
  vpc_id = aws_vpc.finalproject-VPC.id
  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.finalproject-NGW.id
  }
  tags = {
    Name = "RedisSubnetA"
  }
}

resource "aws_route_table_association" "RedisSubnetA" {
  route_table_id = aws_route_table.RedisSubneta.id
  subnet_id      = aws_subnet.Subnet_Redis1.id
}

resource "aws_route_table" "VotingSubenetB" {
  vpc_id = aws_vpc.finalproject-VPC.id
  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.finalproject-NGW.id
  }
  tags = {
    Name = "VotingAppSubnetB"
  }
}
resource "aws_route_table_association" "VotingSubentB" {
  route_table_id = aws_route_table.VotingSubenetB.id
  subnet_id      = aws_subnet.Subnet_App2.id
}

resource "aws_route_table" "RedisSubnetB" {
  vpc_id = aws_vpc.finalproject-VPC.id
  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.finalproject-NGW.id
  }
  tags = {
    Name = "RedisSubnetB"
  }
}

resource "aws_route_table_association" "RedisSubnetB" {
  route_table_id = aws_route_table.RedisSubnetB.id
  subnet_id      = aws_subnet.Subnet_Redis2.id
}