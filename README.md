# terraform-helm-atlantis

A Terraform module for deploying [Atlantis](https://www.runatlantis.io/) via Helm.

## Requirements

| Name       | Version   |
| ---------- | --------- |
| terraform  | ~> 0.12.0 |
| helm       | ~> 1.1    |
| kubernetes | ~> 1.11   |
| template   | ~> 2.1    |

## Providers

| Name       | Version |
| ---------- | ------- |
| helm       | ~> 1.1  |
| kubernetes | ~> 1.11 |

## Inputs

| Name                              | Description                                                    | Type     | Default           | Required |
| --------------------------------- | -------------------------------------------------------------- | -------- | ----------------- | :------: |
| atlantis_github_token             | GitHub Atlantis user token (see Atlantis installation guide)   | `string` | n/a               |   yes    |
| atlantis_github_user              | GitHub Atlantis user (see Atlantis installation guide)         | `string` | n/a               |   yes    |
| atlantis_host                     | Hostname for Atlantis (will be utilised in ingress if enabled) | `string` | n/a               |   yes    |
| atlantis_ingress_class            | Ingress class to use for Atlantis                              | `string` | `"nginx"`         |    no    |
| atlantis_ingress_enabled          | Enable/disable Atlantis ingress                                | `bool`   | `true`            |    no    |
| atlantis_ingress_tls_acme_enabled | Enable/disable acme TLS for ingress                            | `string` | `"true"`          |    no    |
| atlantis_ingress_tls_secret_name  | Secret name for Atlantis TLS cert                              | `string` | `"atlantis-cert"` |    no    |
| atlantis_org_whitelist            | Github org whitelist (see Atlantis installation guide)         | `string` | n/a               |   yes    |
| atlantis_webhook_secret           | GitHub webhook secret (see Atlantis installation guide)        | `string` | n/a               |   yes    |
| helm_atlantis_chart_version       | Atlantis helm chart version to use                             | `string` | `""`              |    no    |
| kubernetes_atlantis_namespace     | Namespace to release Atlantis into                             | `string` | `"atlantis"`      |    no    |

## Outputs

No output.
