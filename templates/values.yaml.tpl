orgWhitelist: ${ atlantis_org_whitelist }

ingress:
  enabled: ${ atlantis_ingress_enabled }
  annotations:
    kubernetes.io/ingress.class: ${ atlantis_ingress_class }
    kubernetes.io/tls-acme: "${ atlantis_ingress_tls_acme_enabled }"
  hosts:
    - host: ${ atlantis_host }
      paths:
        - "/"
  tls:
    - secretName: ${ atlantis_ingress_tls_secret_name }
      hosts:
        - ${ atlantis_host }
