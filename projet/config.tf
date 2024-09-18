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
    dev  = ""
    prod = ""
  }
  oauthclient_secret = {
    dev  = ""
    prod = ""
  }
}

provider "genesyscloud" {
  oauthclient_id     = local.oauthclient_id[terraform.workspace]
  oauthclient_secret = local.oauthclient_secret[terraform.workspace]
  aws_region         = ""
}

resource "genesyscloud_routing_wrapupcode" "erreur_numero" {
  name = "Erreur numéro Alexis Test"
}