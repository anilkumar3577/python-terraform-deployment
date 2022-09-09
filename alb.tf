resource "aws_lb" "external-elb" {
  name               = "TF-LB"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.tf-sg.id]
  subnets            = [aws_subnet.tf-pub-sn-1.id, aws_subnet.tf-pub-sn-2.id]
}

resource "aws_lb_target_group" "external-elb" {
  name     = "TF-TG"
  port     = 80
  protocol = "HTTP"
  vpc_id   = aws_vpc.tf-vpc.id
}

resource "aws_lb_target_group_attachment" "external-elb1" {
  target_group_arn = aws_lb_target_group.external-elb.arn
  target_id        = aws_instance.CC-ec2.id
  port             = 80

  depends_on = [
    aws_instance.CC-ec2,
  ]
}

resource "aws_lb_target_group_attachment" "external-elb2" {
  target_group_arn = aws_lb_target_group.external-elb.arn
  target_id        = aws_instance.mario-ec2.id
  port             = 80

  depends_on = [
    aws_instance.mario-ec2,
  ]
}

resource "aws_lb_listener" "external-elb" {
  load_balancer_arn = aws_lb.external-elb.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.external-elb.arn
  }
}
