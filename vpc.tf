# VPC
resource "aws_vpc" "vpc" {
  cidr_block           = var.cidr_vpc #rango de ip de la vpc
  instance_tenancy     = "default"
  enable_dns_support   = true #crear el dns de mi instancia
  enable_dns_hostnames = true

  tags = {
    Name = "vpc-${local.proyect}-${local.environment}"
  }
}

# PUBLIC SUBNETS
resource "aws_subnet" "public_subnets" {
  vpc_id                  = aws_vpc.vpc.id     #vinculo con la VPC
  cidr_block              = "172.31.10.0/24"   #rango de mi subnet publica
  availability_zone       = "${local.region}a" #Zona de disponibilidad
  map_public_ip_on_launch = true               #genera mi ip publica

  tags = {
    Name = "vpc-${local.proyect}-${local.environment}"
  }
  #   depends_on = [aws_vpc.vpc]
}

# INTERNET GATEWAY
resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.vpc.id #vinculo con la VPC   

  tags = {
    Name = "vpc-${local.proyect}-${local.environment}"
  }
  depends_on = [aws_vpc.vpc]
}

# ROUTING TABLE
resource "aws_route_table" "rt" {
  vpc_id = aws_vpc.vpc.id #vinculo con la VPC

  route {
    cidr_block = var.routing_table_cird_block #Ruta para mi rango ip hacia el internet gateway
    gateway_id = aws_internet_gateway.gw.id   #vinculo con el internet gateway
  }

  tags = {
    Name = "vpc-${local.proyect}-${local.environment}"
  }
  depends_on = [aws_vpc.vpc]
}

# ROUTING TABLE ASSOCIATION
resource "aws_route_table_association" "public-rt-subnets" {
  subnet_id      = aws_subnet.public_subnets.id #vinculo con el ID de la subnet publica
  route_table_id = aws_route_table.rt.id        #cinvulo con el ID de la tabla de ruteo
  depends_on     = [aws_subnet.public_subnets, aws_route_table.rt]
}