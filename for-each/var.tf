variable "instances" {
    type = map
    default = {
        mysql = "t3.small"
        backend = "t3.micro"
        frontend = "t3.micro"
    }
}

variable "zone_id" {

default = "Z047033534XH9OO4TGU3"

}
variable "domain_name" {
    default = "somisettibhavya.life"
}