provider "aws" {
  region      = var.aws_region
  secret_key  = var.aws_secret_key  
  access_key  = var.aws_access_key

  default_tags {
    tags = {
      Environment = "dev"
      Origin      = "mycluster"
      Owner       = "ops"
    }
  }
}