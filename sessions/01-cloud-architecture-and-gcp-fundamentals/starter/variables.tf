variable "project_id" {
  description = "Your GCP project ID, e.g. cc-anna-123456 (own account) or cc-anna-1234 (course account)"
  type        = string
}

variable "region" {
  description = "Where your resources live. europe-west3 is Frankfurt."
  type        = string
  default     = "europe-west1"
}

variable "neighbour_email" {
  description = "The Google account email of the person next to you"
  type        = string
}
