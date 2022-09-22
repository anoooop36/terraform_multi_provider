terraform {
  required_providers {
    lightstep = {
      source = "lightstep/lightstep"
      version = "1.62.0"
    }
    local = {
      source = "hashicorp/local"
      version = "2.2.3"
    }
  }
}


  #api_key         = "your-lightstep-org-api-key"
  #organization    = "your-lightstep-organization"
provider "local" {
  # Configuration options
}


provider "http" {
  # Configuration options
}

data "http" "example" {
  url = "https://checkpoint-api.hashicorp.com/v1/check/terraform"

  # Optional request headers
  request_headers = {
    Accept = "application/json"
  }
}

provider "aws" {
 access_key = var.access_key
 secret_key = var.secret_key
 region     = var.region
}

provider "lightstep" {
  api_key         = var.lightStepKey
  organization    = var.lightstepOrg
}



resource "aws_ebs_volume" "awsEbsExampleWithList" {
  availability_zone = "us-east-1a"
  size              = var.ebsSizes[0]
  tags              = {
                        Name = data.http.example.status_code
                      }
}



variable "access_key" {}
variable "secret_key" {}
variable "lightStepKey" {}
variable "lightstepOrg" {}

variable "region" {
 type    = string
 default = "us-east-1"
}

variable "sampleTags" {
  default = ["Dev ebs volume with List", "Test ebs volume with List", "Prod ebs volume with List"]
  type = list(string)
}

variable "ebsSizes" {
  type = list(number)
  default = [40, 80, 120]
}
