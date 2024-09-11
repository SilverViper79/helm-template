{{/*
This is a Helm helpers template file (helpers.tpl) that defines reusable functions
*/}}

{{- define "app.fullname" -}}
{{- if .Values.app.nameOverride }}
{{- .Values.app.nameOverride | trunc 63 | trimSuffix "-" -}}
{{- else if .Values.app.fullnameOverride }}
{{- .Values.app.fullnameOverride | trunc 63 | trimSuffix "-" -}}
{{- else }}
{{- $name := default .Chart.Name .Values.app.name }}
{{- $release := .Release.Name | trunc 63 | trimSuffix "-" }}
{{- printf "%s-%s" $release $name | trunc 63 | trimSuffix "-" -}}
{{- end -}}
{{- end }}

{{/*
Generate a name for resources based on the release name, chart name, or a user-defined override.
*/}}

{{- define "app.name" -}}
{{- if .Values.app.nameOverride }}
{{- .Values.app.nameOverride | trunc 63 | trimSuffix "-" -}}
{{- else }}
{{- .Chart.Name | trunc 63 | trimSuffix "-" -}}
{{- end -}}
{{- end }}
