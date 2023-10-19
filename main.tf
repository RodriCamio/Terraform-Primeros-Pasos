terraform {
  required_providers {          #requiere de un proveedor 
    aws = {                     #en este caso AWS
      source  = "hashicorp/aws" #¿Dónde encuentro el proveedor? En el repositorio de hashicorp
      version = "~> 3.0"        #queremos instalar una versión superior o igual a 3.0
    }
  }
}
provider "aws" {
    region = "us-east-1" #configuramos la región de nuestro proveedor
    access_key = var.access_key #acá usamos la variable que creamos con el "var." llamamos a la variable.
    secret_key = var.secret_key 
}
