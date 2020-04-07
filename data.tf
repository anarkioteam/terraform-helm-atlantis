data "aws_iam_role" "atlantis" {
  name = var.eks_iam_atlantis_role_name
}

data "helm_repository" "stable" {
  name = "stable"
  url  = "https://kubernetes-charts.storage.googleapis.com"
}
