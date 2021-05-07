# AWS Terraform Module
Terraform module that deploys a target group and attaches it to an existing load balancer

#Usage instruction
```hcl
module "and-lb-listener" {
  source  = "luboleg/tg-and-lb-listener/aws"
  version = "~>0"
  tcp_port    = 1521
  environment = dev
  nlb_arn     = ARN OF SOME NLB or ALB
  vpc_id      = VPC ID
}
```

#Outputs 
tg_arn : Arn of created target group
