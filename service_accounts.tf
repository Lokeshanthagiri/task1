# CI/CD Service Account
resource "google_service_account" "cicd_sa" {
  account_id   = "cicd-deployer-sa"
  display_name = "CI/CD Deployer Service Account"
  description  = "Used by CI/CD pipelines to deploy to GKE"
}

# Workload Identity Service Account
resource "google_service_account" "workload_identity_sa" {
  account_id   = "gke-workload-sa"
  display_name = "GKE Workload Identity SA"
  description  = "Bound to Kubernetes SA via Workload Identity"
}

# COMMENT THIS OUT — needs GKE cluster first
# resource "google_service_account_iam_binding" "workload_identity_binding" {
#   service_account_id = google_service_account.workload_identity_sa.name
#   role               = "roles/iam.workloadIdentityUser"
#   members = [
#     "serviceAccount:${var.project_id}.svc.id.goog[default/gke-workload-ksa]"
#   ]
# }