output "cicd_service_account" {
  value = google_service_account.cicd_sa.email
}

output "workload_identity_sa" {
  value = google_service_account.workload_identity_sa.email
}