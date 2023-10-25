resource "aws_instance" "EC2" {
  ami           = var.ami #ami de ubuntu focal 
  instance_type = var.instance_type #t2.micro 
  associate_public_ip_address = true #autoasigna una ip publica
  # subnet_id     = module.vpc.private_subnets[0]
  key_name      = "TF_keys" #nombre de la key para conectarnos

  vpc_security_group_ids = [aws_security_group.terraform-sg.id] #security group con los permisos SSH y HTTP

  tags = local.tags
}