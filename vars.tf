variable "kubernetes_atlantis_namespace" {
  description = "Namespace to release Atlantis into"
  type        = string
  default     = "atlantis"
}

variable "helm_atlantis_chart_version" {
  description = "Atlantis helm chart version to use"
  type        = string
  default     = ""
}

variable "atlantis_github_user" {
  description = "GitHub Atlantis user (see Atlantis installation guide)"
  type        = string
}

variable "atlantis_github_token" {
  description = "GitHub Atlantis user token (see Atlantis installation guide)"
  type        = string
}

variable "atlantis_webhook_secret" {
  description = "GitHub webhook secret (see Atlantis installation guide)"
  type        = string
}

variable "atlantis_org_whitelist" {
  description = "Github org whitelist (see Atlantis installation guide)"
  type        = string
}

variable "atlantis_host" {
  description = "Hostname for Atlantis (will be utilised in ingress if enabled)"
  type        = string
}

variable "atlantis_ingress_class" {
  description = "Ingress class to use for Atlantis"
  type        = string
  default     = "nginx"
}

variable "atlantis_ingress_enabled" {
  description = "Enable/disable Atlantis ingress"
  type        = bool
  default     = true
}

variable "atlantis_ingress_tls_acme_enabled" {
  description = "Enable/disable acme TLS for ingress"
  type        = string
  default     = "true"
}

variable "atlantis_ingress_tls_secret_name" {
  description = "Secret name for Atlantis TLS cert"
  type        = string
  default     = "atlantis-cert"
}

variable "eks_iam_atlantis_role_name" {
  description = "IAM EKS service account role name for Atlantis"
  type        = string
}
