# SECURITY GROUP (22, 80, 8080)
resource "aws_security_group" "terraform-sg" {
  name        = var.name_sg
  description = "Permisos de SSH y HTTP"
  vpc_id      = aws_vpc.vpc.id
  tags        = local.tags

  # INGRESS RULES
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    description = "Habilita el acceso SSH al puerto 22"
  }

  ingress {
    from_port   = "80"
    to_port     = "80"
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    description = "Habilita el acceso HTTP al puerto 80"
  }

  ingress {
    from_port   = "8080"
    to_port     = "8080"
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    description = "Habilita el acceso HTTP al puerto 8080"
  }

  # EGRESS RULES
  egress {
    from_port   = "0"
    to_port     = "0"
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

}