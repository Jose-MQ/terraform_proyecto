provider "aws" {
    access_key = "test"
    secret_key = "test"
    region = "us-east-1"

    s3_use_path_style           = true
    skip_credentials_validation = true
    skip_metadata_api_check     = true
    skip_requesting_account_id  = true

    endpoints {
    s3             = "http://s3.localhost.localstack.cloud:4566"
    ec2            = "http://localhost:4566"
  }
}

resource "aws_s3_bucket" "bucket1" {
  bucket = "bucket1"
}

resource "aws_instance" "ec2" {
    ami = "ami-0b301ce3ce347599c"
  instance_type = "t2.micro"

    cpu_options {
    core_count       = 2
    threads_per_core = 2
  }

    tags = {
      Name = "instancia1" 
    }
 }

 module "s3" {
   source = "./modules/mi-recurso"
 }