terraform {
  backend "s3" {
    bucket  = "vpc-lattice-backend-bucket"
    region  = "us-east-1"
    key     = "EKS/terraform.tfstate"
    profile = "<aws_profile>"
    encrypt = true
  }
}
