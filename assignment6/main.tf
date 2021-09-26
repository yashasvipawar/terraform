provider "aws"{
    region = "us-east-1"
    access_key = "AKIAZGKT7DCBPQ3NU524"
    secret_key = "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"
}

resource "random_id" "tf_bucket_id" {
  
  byte_length = 2
}

resource "aws_s3_bucket" "tf_code" {
  
  bucket = "${var.project_name}-${random_id.tf_bucket_id.dec}"
  acl="private"
  force_destroy = true
 
    tags = {
         Name = "tf_bucket"
          }
}