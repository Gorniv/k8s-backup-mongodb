{{/*
Expand the name of the chart.
*/}}
{{- define "k8s-backup-mongodb.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "k8s-backup-mongodb.fullname" -}}
{{- if .Values.fullnameOverride }}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- $name := default .Chart.Name .Values.nameOverride }}
{{- if contains $name .Release.Name }}
{{- .Release.Name | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" }}
{{- end }}
{{- end }}
{{- end }}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "k8s-backup-mongodb.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Allow the release namespace to be overridden for multi-namespace deployments in combined charts.
*/}}
{{- define "k8s-backup-mongodb.namespace" -}}
    {{- if and .Values.global .Values.global.namespaceOverride -}}
        {{- print .Values.global.namespaceOverride -}}
    {{- else -}}
        {{- print .Release.Namespace -}}
    {{- end }}
{{- end -}}

{{/*
Common labels
*/}}
{{- define "k8s-backup-mongodb.labels" -}}
helm.sh/chart: {{ include "k8s-backup-mongodb.chart" . }}
{{ include "k8s-backup-mongodb.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "k8s-backup-mongodb.selectorLabels" -}}
app.kubernetes.io/name: {{ include "k8s-backup-mongodb.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{/*
Create the name of the service account to use
*/}}
{{- define "k8s-backup-mongodb.serviceAccountName" -}}
{{- if .Values.serviceAccount.create }}
{{- default (include "k8s-backup-mongodb.fullname" .) .Values.serviceAccount.name }}
{{- else }}
{{- default "default" .Values.serviceAccount.name }}
{{- end }}
{{- end }}
