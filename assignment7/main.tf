provider "aws"{
    region = "us-east-1"
    access_key = ""
    secret_key = ""
}

resource "random_id" "tf_bucket_id" {
  
  byte_length = 2
  
}

resource "aws_s3_bucket" "tf_code" {
  
  #bucket = "${var.project_name}-${random_id.tf_bucket_id.dec}"
  count  = length(var.number_of_instances)
  bucket = var.number_of_instances[count.index]

  acl="private"
  force_destroy = true
  
 
    tags = {
         Name = "tf_bucket"
          }
}