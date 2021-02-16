#Tool-Box Jenkins and Ansible
resource "aws_instance" "Tool-Box" {
  ami                         = var.ami-id
  instance_type               = var.instance_type
  availability_zone           = var.availability_zone1
  subnet_id                   = aws_subnet.finalprojectPublicSubnet1.id
  security_groups             = [aws_security_group.Public_Instance_SG.id]
  user_data                   = file("${path.module}/Data/install.sh")
  key_name                    = var.keypair
  associate_public_ip_address = true
  tags = {
    Name = "${var.servicename}-Tool-Box"
  }
}

#Monitoring Server
resource "aws_instance" "Monitoring" {
  ami                         = var.ami-id
  instance_type               = var.instance_type
  availability_zone           = var.availability_zone1
  subnet_id                   = aws_subnet.finalprojectPublicSubnet1.id
  security_groups             = [aws_security_group.Public_Instance_SG.id]
  associate_public_ip_address = true
  key_name                    = var.keypair
  tags = {
    Name = "${var.servicename}-Monitoring-Box"
  }
}

#Web-Server
resource "aws_instance" "Web-Server" {
  ami                         = var.ami-id
  instance_type               = var.instance_type
  availability_zone           = var.availability_zone1
  subnet_id                   = aws_subnet.finalprojectPublicSubnet1.id
  security_groups             = [aws_security_group.Public_Instance_SG.id]
  associate_public_ip_address = true
  key_name                    = var.keypair
  tags = {
    Name = "${var.servicename}-Web-Server"
  }
}

#App Server in AZ a
resource "aws_instance" "App-Server-A" {
  ami               = var.ami-id
  instance_type     = var.instance_type
  availability_zone = var.availability_zone1
  subnet_id         = aws_subnet.Subnet_App1.id
  security_groups   = [aws_security_group.Public_Instance_SG.id]
  key_name          = var.keypair
  tags = {
    Name = "${var.servicename}-App-Server-a"
  }
}

#App Server in AZ a
resource "aws_instance" "Redis-Server-A" {
  ami               = var.ami-id
  instance_type     = var.instance_type
  availability_zone = var.availability_zone1
  subnet_id         = aws_subnet.Subnet_Redis1.id
  security_groups   = [aws_security_group.Public_Instance_SG.id]
  key_name          = var.keypair
  tags = {
    Name = "${var.servicename}-Redis-Server-a"
  }
}

#App Server in AZ B
resource "aws_instance" "App-Server-B" {
  ami               = var.ami-id
  instance_type     = var.instance_type
  availability_zone = var.availability_zone2
  subnet_id         = aws_subnet.Subnet_App2.id
  security_groups   = [aws_security_group.Public_Instance_SG.id]
  key_name          = var.keypair
  tags = {
    Name = "${var.servicename}-App-Server-B"
  }
}

#App Server in AZ B
resource "aws_instance" "Redis-Server-B" {
  ami               = var.ami-id
  instance_type     = var.instance_type
  availability_zone = var.availability_zone2
  subnet_id         = aws_subnet.Subnet_Redis2.id
  security_groups   = [aws_security_group.Public_Instance_SG.id]
  key_name          = var.keypair
  tags = {
    Name = "${var.servicename}-Redis-Server-B"
  }
}
