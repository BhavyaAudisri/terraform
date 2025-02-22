variable "instances" {
    default = ["mysql", "backend", "frontend"]
}

variable "zone_id" {
    default = "Z04682941QH8S5QB2E0V1"
}

variable "domain_name" {
    default = "somisettibhavya.life"
}

variable "common_tags" {
    type = map
    default = {
        Project = "expense"
        Environment = "dev"
    }
}