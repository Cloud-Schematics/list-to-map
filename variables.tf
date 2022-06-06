##############################################################################
# Variables
##############################################################################

variable "list" {
  description = "List of objects"
}

variable "prefix" {
  description = "Prefix to add to map keys"
  type        = string
  default     = null
}

variable "key_name_field" {
  description = "Name of the key inside a list object to be used as the key for the object in the returned output map."
  type        = string
  default     = "name"
}

variable "lookup_field" {
  description = "Name of the field to find with lookup"
  type        = string
  default     = null
}

variable "contains" {
  description = "Check to see if the object does contain key from `var.lookup_field` if true and does not contain `var.lookup_field` if false."
  type        = bool
  default     = null
}


##############################################################################