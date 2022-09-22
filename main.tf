terraform {
  required_providers {
    lightstep = {
      source = "lightstep/lightstep"
      version = "1.62.0"
    }
  }
}


provider "azurerm" {
 access_key = var.access_key
 secret_key = var.secret_key
 region     = var.region
}

provider "azurerm" {
 access_key = var.access_key
 secret_key = var.secret_key
 region     = var.region
}

provider "lightstep" {
  api_key         = "your-lightstep-org-api-key"
  organization    = "your-lightstep-organization"
}

resource "aws_ebs_volume" "awsEbsExampleWithList" {
  availability_zone = "us-east-1a"
  size              = var.ebsSizes[0]
  tags              = {
                        Name = var.sampleTags[1]
                      }
}



variable "access_key" {}
variable "secret_key" {}

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
