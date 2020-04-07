resource "kubernetes_namespace" "atlantis" {
  metadata {
    name = var.kubernetes_atlantis_namespace
  }
}

resource "helm_release" "atlantis" {
  depends_on = [kubernetes_namespace.atlantis]

  name       = "atlantis"
  repository = data.helm_repository.stable.metadata[0].name
  chart      = "atlantis"
  namespace  = var.kubernetes_atlantis_namespace
  version    = var.helm_atlantis_chart_version == "" ? null : var.helm_atlantis_chart_version

  values = [
    templatefile(
      "${path.module}/templates/values.yaml.tpl",
      {
        "atlantis_host"          = var.atlantis_host
        "atlantis_org_whitelist" = var.atlantis_org_whitelist

        "atlantis_ingress_enabled"          = var.atlantis_ingress_enabled
        "atlantis_ingress_tls_acme_enabled" = var.atlantis_ingress_tls_acme_enabled
        "atlantis_ingress_class"            = var.atlantis_ingress_class
        "atlantis_ingress_tls_secret_name"  = var.atlantis_ingress_tls_secret_name

        "eks_iam_atlantis_role_arn" = var.eks_iam_atlantis_role_arn
      }
    )
  ]

  set_sensitive {
    name  = "github.user"
    value = var.atlantis_github_user
  }

  set_sensitive {
    name  = "github.token"
    value = var.atlantis_github_token
  }

  set_sensitive {
    name  = "github.secret"
    value = var.atlantis_webhook_secret
  }
}
