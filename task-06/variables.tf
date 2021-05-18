 
# initial variable definitions
variable "demo_name" {
  description = "Base name of resources"
  type        = string
  default     = "prod-ci"
}
variable "suffix" {
  description = "Name of VPC"
  type        = bool
  default     = false
}