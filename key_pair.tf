resource "aws_key_pair" "TF-key" { #recurso para crear una llave publica tomado de terraform registry
  key_name   = "TF_keys"            #nombre de la llave publica
  public_key = tls_private_key.rsa.public_key_openssh #creacion de la llave publica en aws
}
resource "tls_private_key" "rsa" { #recurso para crear las llaves con RSA
  algorithm = "RSA" #tipo de algoritmo
  rsa_bits  = 4096  #key de un tamaño de 4096 bits
}
resource "local_file" "TF_key" { #recurso para crear un archivo local
  content  = tls_private_key.rsa.private_key_pem #creacion de la private key
  filename = "/home/key/TF_keys.pem" #directorio donde ubique la llave, previamente lo habia creado como root
  directory_permission = 400 #permisos de solo lectura para el directorio
  file_permission = 400 #permisos de solo lectura para el archivo, en este caso la llave.
}