variable "project" {
  default = "expense"
}
/* variable "environment" {

} */
variable "instances" {
  default = ["mysql", "backend", "frontend"]
}

/* variable "zone_id" {
  default = "Z047033534XH9OO4TGU3"
}

variable "domain_name" {
  default = "somisettibhavya.life"
} */

variable "common_tags" {
  type = map(any)
  default = {
    Project     = "expense"
    Environment = "dev"
  }

}