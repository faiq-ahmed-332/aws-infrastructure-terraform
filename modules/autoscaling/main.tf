resource "aws_autoscaling_group" "web_asg" {
  name                      = "web-autoscaling-group"
  max_size                  = 10
  min_size                  = 3
  desired_capacity          = 3
  health_check_type         = "EC2"
  health_check_grace_period = 300
  vpc_zone_identifier       = [var.subnet_id]
  launch_configuration      = aws_launch_configuration.web_lc.name

  tag {
    key                 = "Name"
    value               = "web-server"
    propagate_at_launch = true
  }
}

resource "aws_launch_configuration" "web_lc" {
  name_prefix                 = "web-launch-config"
  image_id                    = "ami-12345678"
  instance_type               = "t2.micro"
  security_groups             = [var.security_group_id]
  associate_public_ip_address = true
}