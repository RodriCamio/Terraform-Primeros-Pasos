#terraform 
terraform {
  required_providers { #requiere de un proveedor
    aws = { #Elegimos el de AWS
      source  = "hashicorp/aws" # ¿De donde obtenemos el proveedor? Lo obtenemos de la pagina oficial de hashicorp
      version = "~> 4.16" # ¿Con que version vamos a trabajar? Con la version 4.16 o superior.
    }
  }

  required_version = ">= 1.2.0" #esta es la version de terraform que tiene que ser mayor o igual a 1.2.0
}

#provider
provider "aws" { 
  region = "us-east-1" #N. Virginia
}

#Modulo de instancia EC2
module "ec2_instances" { 
  source  = "terraform-aws-modules/ec2-instance/aws" #¿De donde obtenemos el modulo? De terraform registry
  version = "4.3.0" #version del modulo.

  count = 2 #cantidad de instancias a crear
  name  = "Instancia-${count.index}" #el nombre que les asignamos a cada una

  ami                    = "ami-0261755bbcb8c4a84" #imagen de ubuntu focal 
  instance_type          = "t2.micro" #free tier
  vpc_security_group_ids = [module.vpc.default_security_group_id] #modulo de vpc, el security group id por defecto
  subnet_id              = module.vpc.public_subnets[0] #el subnet id 

  tags = { #algunos tags
    Terraform   = "true" 
    Environment = "dev" 
  }
}