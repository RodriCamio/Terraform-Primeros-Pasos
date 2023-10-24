terraform {
  required_version = ">= 0.12"
}
provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "foo" {
  ami           = "ami-0261755bbcb8c4a84" # us-west-2
  instance_type = "t2.micro"
  associate_public_ip_address = module.vpc.public_subnets[0]
  subnet_id     = module.vpc.private_subnets[0]
  key_name      = module.key_pair.key_pair_name

  vpc_security_group_ids = [aws_security_group.terraform-sg.id]

  #   credit_specification {
  #     cpu_credits = "unlimited"
  #   }
  tags = {
    name = var.tags
  }
}