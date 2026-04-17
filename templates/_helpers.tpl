{{/*
  Name (and namespace) of the cluster Argo CD CR to patch for ingress TLS (see templates/default-routes.yaml).
  Presets: vp-gitops (Validated Patterns), openshift-gitops (OpenShift GitOps operator default).
*/}}
{{- define "letsencrypt.gitopsInstanceName" -}}
{{- $i := .Values.letsencrypt.gitopsInstance | default "vp-gitops" -}}
{{- if not (or (eq $i "vp-gitops") (eq $i "openshift-gitops")) -}}
{{- fail (printf "letsencrypt.gitopsInstance must be \"vp-gitops\" or \"openshift-gitops\", got %q" $i) -}}
{{- end -}}
{{- print $i -}}
{{- end -}}
