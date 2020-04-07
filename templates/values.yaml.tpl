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

extraManifests:
  - apiVersion: rbac.authorization.k8s.io/v1beta1
    kind: ClusterRole
    metadata:
      name: '{{ template "atlantis.fullname" . }}'
      labels:
        app: '{{ template "atlantis.name" . }}'
        chart: '{{ template "atlantis.chart" . }}'
        release: '{{ .Release.Name }}'
        heritage: '{{ .Release.Service }}'
    rules:
    - apiGroups:
      - ""
      resources:
      - services
      - pods
      - nodes
      verbs:
      - get
      - list
      - watch
  - apiVersion: rbac.authorization.k8s.io/v1beta1
    kind: ClusterRoleBinding
    metadata:
      name: '{{ template "atlantis.fullname" . }}'
      labels:
        app: '{{ template "atlantis.name" . }}'
        chart: '{{ template "atlantis.chart" . }}'
        release: '{{ .Release.Name }}'
        heritage: '{{ .Release.Service }}'
    roleRef:
      apiGroup: rbac.authorization.k8s.io
      kind: ClusterRole
      name: '{{ template "atlantis.fullname" . }}'
    subjects:
    - kind: ServiceAccount
      name: '{{ template "atlantis.fullname" . }}'
      namespace: '{{ .Release.Namespace }}'
