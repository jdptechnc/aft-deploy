terraform {
  backend "s3" {
    bucket       = "jdp-aft-module-backend-v2"
    key          = "module-deployment/terraform.tfstate"
    region       = "us-east-1"
    encrypt      = true
    use_lockfile = true #S3 native locking
  }
}
