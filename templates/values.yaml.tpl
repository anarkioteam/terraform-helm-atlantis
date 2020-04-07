orgWhitelist: ${ atlantis_org_whitelist }

serviceAccount:
  annotations:
    eks.amazonaws.com/role-arn: ${ eks_iam_atlantis_role_arn }

ingress:
  enabled: ${ atlantis_ingress_enabled }
  annotations:
    kubernetes.io/ingress.class: ${ atlantis_ingress_class }
    kubernetes.io/tls-acme: "${ atlantis_ingress_tls_acme_enabled }"
  host: ${ atlantis_host }
  tls:
    - secretName: ${ atlantis_ingress_tls_secret_name }
      hosts:
        - ${ atlantis_host }
