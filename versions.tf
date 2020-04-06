terraform {
  required_version = "~> 0.12.0"

  required_providers {
    kubernetes = "~> 1.11"
    helm       = "~> 1.1"
    template   = "~> 2.1"
  }
}
