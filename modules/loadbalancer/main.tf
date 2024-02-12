resource "aws_lb" "lb" {
  name               = "my-load-balancer"
  internal           = false
  load_balancer_type = "application"
  subnets            = var.subnet_id
}
