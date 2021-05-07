
variable "tcp_port" {
  description = "Port for NLB"
}

variable "target_group_target_type" {
  default     = "instance"
  description = "Target group type"
}

variable "environment" {
  description = "Environment name"
}

variable "aws_region" {
  default     = "eu-west-1"
  description = "Region"
}

variable "health_check_enabled" {
  type        = bool
  default     = true
  description = "A boolean flag to enable/disable the NLB health checks"
}

variable "health_check_port" {
  type        = number
  default     = null
  description = "The port to send the health check request to (defaults to `traffic-port`)"
}

variable "health_check_protocol" {
  type        = string
  default     = null
  description = "The protocol to use for the health check request"
}

variable "health_check_path" {
  type        = string
  default     = "/"
  description = "The destination for the health check request"
}

variable "health_check_threshold" {
  type        = number
  default     = 2
  description = "The number of consecutive health checks successes required before considering an unhealthy target healthy, or failures required before considering a health target unhealthy"
}

variable "health_check_interval" {
  type        = number
  default     = 10
  description = "The duration in seconds in between health checks"
}

variable "nlb_arn" {
  description = "Arn for NLB which will be used for an attachment"
}

variable "vpc_id" {
  description = "VPC ID"
}