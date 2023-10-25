resource "aws_security_group" "terraform-sg" {
  name        = var.name_sg
  description = "Permisos de SSH y HTTP"
  # vpc_id      = module.vpc.vpc_id
  tags = local.tags

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}