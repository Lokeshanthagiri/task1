# Developer Role - deploy to dev environment
resource "google_project_iam_custom_role" "gke_developer" {
  role_id     = "gke_developer"
  title       = "GKE Developer"
  description = "Deploy workloads to GKE dev environment only"
  permissions = [
    "container.clusters.get",
    "container.clusters.list",
    "container.deployments.create",
    "container.deployments.update",
    "container.deployments.get",
    "container.deployments.list",
    "container.pods.get",
    "container.pods.list",
    "container.pods.create",
    "container.pods.delete",
    "container.services.create",
    "container.services.update",
    "container.services.get",
    "container.namespaces.get",
    "container.namespaces.list",
    "logging.logEntries.list"
  ]
}

# Viewer Role - read-only for staging/prod
resource "google_project_iam_custom_role" "gke_viewer" {
  role_id     = "gke_viewer"
  title       = "GKE Viewer"
  description = "Read-only access to GKE resources"
  permissions = [
    "container.clusters.get",
    "container.clusters.list",
    "container.deployments.get",
    "container.deployments.list",
    "container.pods.get",
    "container.pods.list",
    "container.services.get",
    "container.namespaces.get",
    "container.namespaces.list"
  ]
}

# DevOps Admin Role - full access everywhere
resource "google_project_iam_custom_role" "devops_admin" {
  role_id     = "devops_admin"
  title       = "DevOps Admin"
  description = "Full access across all environments"
  permissions = [
    "container.clusters.create",
    "container.clusters.delete",
    "container.clusters.get",
    "container.clusters.list",
    "container.clusters.update",
    "container.deployments.create",
    "container.deployments.delete",
    "container.deployments.update",
    "container.deployments.get",
    "container.deployments.list",
    "container.pods.get",
    "container.pods.list",
    "container.pods.create",
    "container.pods.delete",
    "container.services.create",
    "container.services.update",
    "container.services.delete",
    "container.services.get",
    "container.namespaces.create",
    "container.namespaces.delete",
    "container.namespaces.get",
    "container.namespaces.list",
    "iam.serviceAccounts.actAs",
    "logging.logEntries.list",
    "monitoring.timeSeries.list"
  ]
}

# QA Observer Role - logs and metrics only
resource "google_project_iam_custom_role" "qa_observer" {
  role_id     = "qa_observer"
  title       = "QA Observer"
  description = "View logs and metrics only, no modify access"
  permissions = [
    "logging.logEntries.list",
    "logging.logs.list",
    "logging.logMetrics.get",
    "logging.logMetrics.list",
    "monitoring.timeSeries.list",
    "monitoring.metricDescriptors.get",
    "monitoring.metricDescriptors.list",
    "monitoring.dashboards.get",
    "monitoring.dashboards.list"
  ]
}

# CI/CD Deployer Role - automated deployments
resource "google_project_iam_custom_role" "cicd_deployer" {
  role_id     = "cicd_deployer"
  title       = "CICD Deployer"
  description = "Automated deployment role for CI/CD pipelines"
  permissions = [
    "container.clusters.get",
    "container.clusters.list",
    "container.deployments.create",
    "container.deployments.update",
    "container.deployments.get",
    "container.deployments.list",
    "container.pods.get",
    "container.pods.list",
    "container.services.create",
    "container.services.update",
    "container.services.get",
    "container.namespaces.get",
    "container.namespaces.list",
    "storage.objects.get",
    "storage.objects.list",
    "artifactregistry.repositories.get",
    "artifactregistry.repositories.list"
  ]
}