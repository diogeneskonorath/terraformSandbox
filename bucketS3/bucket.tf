provider "aws" {
  region     = "us-east-1"
  access_key = "my-access-key"
  secret_key = "my-secret-key"
}

resource "aws_s3_bucket" "b" {
  bucket = "diogenes-tf-test-bucket"
  acl    = "private"

  tags = {
    Name        = "Diogenes test bucket"
    Environment = "Dev"
  }
}