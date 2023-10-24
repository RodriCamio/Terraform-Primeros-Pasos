# resource "aws_key_pair" "TF-key" { #recurso para crear una llave publica tomado de terraform registry
#   key_name   = "TF-keys"            #nombre de la llave publica
#   public_key = tls_private_key.rsa.public_key_openssh
# }
resource "tls_private_key" "rsa" {
  algorithm = "RSA" #tipo de algoritmo
  rsa_bits  = 4096  #key de un tamaño de 4096 bits
}

module "key_pair" {
  source = "terraform-aws-modules/key-pair/aws"
  key_name           = "TF-keys"
  create_private_key = true
}

module "key_pair_external" {
  source = "terraform-aws-modules/key-pair/aws"

  key_name   = "TF-keys-external"
  public_key = trimspace(tls_private_key.rsa.public_key_openssh)
}

resource "local_file" "TF-key" {
  content  = tls_private_key.rsa.private_key_openssh
  filename = "TF_keys.pem"
}