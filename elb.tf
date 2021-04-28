resource "aws_elb" "main_elb" {
  name               = var.elb_name
  subnets = [ split(",", var.elb_subnets) ]
  internal = var.elb_is_internal
  security_groups = [ var.elb_security_groups ]

dynamic "listener" {
  for_each = var.listener
  content {
    instance_port      = var.backend_port
    instance_protocol  = var.backend_protocol
    lb_port            = var.load_balancer_port
    lb_protocol        = var.load_balancer_protocol
  }
}

health_check {
  healthy_threshold   = var.healthy_threshold
  unhealthy_threshold = var.unhealthy_threshold
  timeout             = var.timeout
  target              = var.health_check_target
  interval            = var.interval
}

  cross_zone_load_balancing   = var.cross_zone_load_balancing
  idle_timeout                = var.idle_timeout
  connection_draining         = var.connection_draining
  connection_draining_timeout = var.connection_draining_timeout
  
}