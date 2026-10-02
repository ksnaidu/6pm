terraform {
  required_providers {
    aws = {
        source = "hashicorp/aws"
        version = "5.98.0"
    }
  }


  backend "s3" {
    bucket = "6pm-remote-state"
    key    = "remote-state-demo"
    region = "us-east-1"
    # dynamodb_table= "11am-remote-state-lock"
    encrypt       = true
    use_lockfile  = true
  }
}
#configure the aws provider
provider "aws" {
    region = "us-east-1"
  
}
