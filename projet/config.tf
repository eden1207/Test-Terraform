terraform {
  required_providers {
    genesyscloud = {
      source  = "MyPureCloud/genesyscloud"
      version = "~> 1.26.0"
    }
  }
}

locals {
  trigramme = "ALEXIS_TEST"
  oauthclient_id = {
    dev     = var.DEV_CLIENT_ID
    staging = ""
    prod    = ""
  }
  oauthclient_secret = {
    dev     = var.DEV_CLIENT_SECRET
    staging = ""
    prod    = ""
  }
  aws_region = {
    dev     = var.DEV_AWS_REGION
    staging = ""
    prod    = ""
  }
}

provider "genesyscloud" {
  oauthclient_id     = local.oauthclient_id[terraform.workspace]
  oauthclient_secret = local.oauthclient_secret[terraform.workspace]
  aws_region         = var.DEV_AWS_REGION
}

resource "genesyscloud_routing_wrapupcode" "erreur_numero" {
  name = "Erreur numéro Alexis Test"
}