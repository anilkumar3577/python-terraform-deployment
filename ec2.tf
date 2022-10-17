# Creating 1st EC2 instance in Public Subnet 
resource "aws_instance" "CC-ec2" {
  ami                         = "ami-08e2d37b6a0129927"
  instance_type               = "t2.micro"
  key_name                    = "test"
  vpc_security_group_ids      = ["${aws_security_group.tf-sg.id}"]
  subnet_id                   = aws_subnet.tf-pub-sn-1.id
  associate_public_ip_address = true
  user_data                   = file("data.sh")
  tags = {
    Name = "CC-ec2"
  }
}


