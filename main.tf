
provider "aws" {
  region = var.aws_region
}

terraform {
  backend "s3" {}

  required_version = "~> 0.14"
}

locals {
  health_check_port     = coalesce(var.health_check_port, "traffic-port")
  health_check_protocol = coalesce(var.health_check_protocol, "TCP")
}


module "target_group_label" {
  source     = "cloudposse/label/null"
  version    = "~>0"
  attributes = ["default"]

}


resource "aws_lb_target_group" "tg" {
  name        = module.target_group_label.id
  port        = var.tcp_port
  protocol    = "TCP"
  vpc_id      = var.vpc_id
  target_type = var.target_group_target_type

  health_check {
    enabled             = var.health_check_enabled
    port                = local.health_check_port
    protocol            = local.health_check_protocol
    path                = local.health_check_protocol == "HTTP" ? var.health_check_path : null
    healthy_threshold   = var.health_check_threshold
    unhealthy_threshold = var.health_check_threshold
    interval            = var.health_check_interval
  }

  lifecycle {
    create_before_destroy = true
  }

  tags = {
    Environment = var.environment
  }

}


resource "aws_lb_listener" "listener" {
  load_balancer_arn = var.nlb_arn
  port              = var.tcp_port
  protocol          = "TCP"

  default_action {
    target_group_arn = aws_lb_target_group.tg.arn
    type             = "forward"
  }
}

