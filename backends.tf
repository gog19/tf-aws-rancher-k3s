terraform {
  cloud {
    organization = "gog-terraform"

    workspaces {
      name = "gog-dev"
    }
  }
}