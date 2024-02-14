terraform {
  backend "s3" {
    bucket = "acs730-w6-1234"
    key    = "dev/terraform.tfstate"
    region = "us-east-1"
    #    dynamodb_table = "RemoteState"
  }
}