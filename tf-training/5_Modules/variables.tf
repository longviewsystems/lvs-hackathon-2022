variable "project_name" {
  type        = string
  description = "Globally used project name"
  default     = "terraform-cloud-aks"
}
 
variable "region" {
  type        = string
  description = "Azure Region that will be used"
  default     = "canadacentral"
}
 
variable "cluster_version" {
  type        = string
  description = "The Kubernetes version for our clusters"
  default     = "1.23.3"
}