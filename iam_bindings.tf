# Developers - deploy to dev (business hours only condition)
resource "google_project_iam_binding" "developer_dev_access" {
  project = var.project_id
  role    = google_project_iam_custom_role.gke_developer.name
  members = [for dev in var.developers : "user:${dev}"]

  condition {
    title      = "BusinessHoursOnly"
    expression = "request.time.getHours('UTC') >= 9 && request.time.getHours('UTC') < 18"
  }
}

# Developers - read only to staging and prod
resource "google_project_iam_binding" "developer_viewer_access" {
  project = var.project_id
  role    = google_project_iam_custom_role.gke_viewer.name
  members = [for dev in var.developers : "user:${dev}"]
}

# DevOps - full access to all environments
resource "google_project_iam_binding" "devops_admin_access" {
  project = var.project_id
  role    = google_project_iam_custom_role.devops_admin.name
  members = [for eng in var.devops_engineers : "user:${eng}"]
}

# QA - logs and metrics view only
resource "google_project_iam_binding" "qa_observer_access" {
  project = var.project_id
  role    = google_project_iam_custom_role.qa_observer.name
  members = ["user:${var.qa_engineer}"]
}

# CI/CD Service Account - deploy to all environments
resource "google_project_iam_binding" "cicd_deploy_access" {
  project = var.project_id
  role    = google_project_iam_custom_role.cicd_deployer.name
  members = ["serviceAccount:${google_service_account.cicd_sa.email}"]
}