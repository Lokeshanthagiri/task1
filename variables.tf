variable "project_id" {
  description = "GCP Project ID"
  type        = string
}

variable "region" {
  description = "GCP Region"
  type        = string
  default     = "us-central1"
}

variable "developers" {
  description = "List of developer emails"
  type        = list(string)
}

variable "devops_engineers" {
  description = "List of DevOps engineer emails"
  type        = list(string)
}

variable "qa_engineer" {
  description = "QA engineer email"
  type        = string
}