ami = "ami-0261755bbcb8c4a84" #ubuntu focal
instance_type = "t2.micro" #free tier
region = "us-east-1" #region de preferencia
environment = "Testing" #ambiente de prueba
proyect = "Desafio M13" #el proyecto es el desafio del modulo 13
team = "DevOps" #el equipo es de DevOps

vpc_name = "VPC DM13" # nombre de la vpc "Desafio Moludo 13"
azs = ["us-east-1a", "us-east-1b", "us-east-1c"]
private_subnets = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
public_subnets = ["10.0.101.0/24", "10.0.102.0/24", "10.0.103.0/24"]

name_sg = "terraform_sg"