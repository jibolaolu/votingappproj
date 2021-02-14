resource "aws_security_group" "Public_Instance_SG" {
  vpc_id = aws_vpc.finalproject-VPC.id
  description = "This is for the servers in the Public Subnet"
  ingress {
    #For SSH Connection
    from_port   = 22
    protocol    = "tcp"
    to_port     = 22
    cidr_blocks = ["0.0.0.0/0"]
  }
  #Connection for Jenkins
  ingress {
    from_port   = 8080
    protocol    = "tcp"
    to_port     = 8080
    cidr_blocks = ["0.0.0.0/0"]
  }

  #Connection for Grafana
  ingress {
    from_port   = 3000
    protocol    = "tcp"
    to_port     = 3000
    cidr_blocks = ["0.0.0.0/0"]
  }

  #Connection for Prometheus
  ingress {
    from_port   = 9090
    protocol    = "tcp"
    to_port     = 9090
    cidr_blocks = ["0.0.0.0/0"]
  }

  #Connection for NodeExporter
  ingress {
    from_port   = 9100
    protocol    = "tcp"
    to_port     = 9100
    cidr_blocks = ["0.0.0.0/0"]
  }

  #Connection for Blackbox
  ingress {
    from_port   = 9115
    protocol    = "tcp"
    to_port     = 9115
    cidr_blocks = ["0.0.0.0/0"]
  }

  #Connection for Alert-manager
  ingress {
    from_port   = 9093
    protocol    = "tcp"
    to_port     = 9093
    cidr_blocks = ["0.0.0.0/0"]
  }

  #Connection for Redis in private 2a
  ingress {
    from_port   = 6379
    protocol    = "tcp"
    to_port     = 6379
    cidr_blocks = ["0.0.0.0/0"]
  }

  #Connection for HTTP
  ingress {
    from_port   = 443
    protocol    = "tcp"
    to_port     = 443
    cidr_blocks = ["0.0.0.0/0"]
  }

  #Connection to the outer world
  egress {
    from_port   = 0
    protocol    = "-1"
    to_port     = 0
    cidr_blocks = ["0.0.0.0/0"]
  }

  #Connectoion to Red 2b
  ingress {
    from_port   = 6380
    protocol    = "tcp"
    to_port     = 6380
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "${var.servicename}-PublicSG"
  }

}


