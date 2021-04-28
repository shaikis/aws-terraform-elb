variable "elb_security_groups" {
    type = list  
}
variable "elb_subnets" {
    type = list
  
}

variable "elb_is_internal" {
    default = false
  
}
variable "listener" {
    type = list(map(string))
  
}
variable "elb_name" {}



variable "cross_zone_load_balancing" {
    default = true
}
variable "idle_timeout" {
    default = 60
}
variable "connection_draining" {
    type = bool
    default = false
}
variable "connection_draining_timeout" {
    default = 300
}


# Listener
variable "backend_port" {}
variable "backend_protocol" {}
variable "load_balancer_port" {}
variable "load_balancer_protocol" {}

# Healthcheck
variable "healthy_threshold" {
    default = 2
}
variable "unhealthy_threshold" {
    default = 5
}
variable "timeout" {
    default = 5
}
variable "health_check_target" {}
variable "interval" {
    default = 30
}
