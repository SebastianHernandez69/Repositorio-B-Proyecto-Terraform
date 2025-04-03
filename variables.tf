variable "subscription_id" {
    type        = string
    description = "The subscription ID to use for the Azure provider."
}

variable "project" {
    type        = string
    description = "The name of the project."
    default     = "ecommerce"
}

variable "environment" {
    type        = string
    description = "The environment (e.g., dev, prod)."
    default     = "dev"
}

variable "location" {
    type        = string
    description = "The Azure region to deploy resources in."
    default     = "Central US"
}

variable "tags" {
    type        = map(string)
    description = "Tags to apply to resources."
    default     = {
        Environment = "dev"
        date: "apr-2025"
        created_by = "Terraform"
    } 
}