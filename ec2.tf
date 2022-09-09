# Creating 1st EC2 instance in Public Subnet 
resource "aws_instance" "CC-ec2" {
  ami                         = "ami-0568773882d492fc8"
  instance_type               = "t2.micro"
  key_name                    = "tests"
  vpc_security_group_ids      = ["${aws_security_group.tf-sg.id}"]
  subnet_id                   = aws_subnet.tf-pub-sn-1.id
  associate_public_ip_address = true
  user_data                   = file("data.sh")
  tags = {
    Name = "CC-ec2"
  }
}

# Creating 2nd EC2 instance in Public Subnet
resource "aws_instance" "mario-ec2" {
  ami                         = "ami-0568773882d492fc8"
  instance_type               = "t2.micro"
  key_name                    = "tests"
  vpc_security_group_ids      = ["${aws_security_group.tf-sg.id}"]
  subnet_id                   = aws_subnet.tf-pub-sn-2.id
  associate_public_ip_address = true
  user_data                   = file("data2.sh")
  tags = {
    Name = "mario-ec2"
  }
}

