# Input variable definitions


variable "name" {
  description = "resource base name"
  type = string
}

variable "suffix" {
  description = "Use Suffixes in the resource names"
  type = bool
}

# copy pasta from internet (dont remember)
variable "tags" {
  description = "Tags to set on the bucket."
  type = map(string)
  default = {}
}