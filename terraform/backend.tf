resource "aws_s3_bucket" "codebuildbucket" {
  bucket = "codebuildtfstate"
  
  tags = {
    Name        = "demo_presentation"
    Environment = "Dev"
  }
}


terraform {
  required_version = ">=0.12.0"
  required_providers {
    aws = ">=3.0.0"
  }
  backend "s3" {
    region  = "us-east-1"
    profile = "default"
    key     = "${aws_s3_bucket.codebuildbucket.bucket}"
    bucket  = "${aws_s3_bucket.codebuildbucket.bucket}"
  }
}
