variable "instances" {
  default = ["server1-nginx", "server2-nginx"]
}
variable "security_groups" {
  default = ["nginx-sec1", "nginx-sec2"]
}