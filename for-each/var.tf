variable "instances" {
    type = map
    default = {
        mysql = "t3.small"
        backend = "t3.micro"
        frontend = "t3.micro"
    }
}

variable "zone_id" {

default = "Z04682941QH8S5QB2E0V1"

}
variable "domain_name" {
    default = "somisettibhavya.life"
}