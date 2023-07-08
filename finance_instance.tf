resource "aws_instance" "egprojectweb" {
  ami                    = var.AMIS[var.REGION]
  instance_type          = "t2.micro"
  key_name               = aws_key_pair.egprojectkey.key_name
  subnet_id              = aws_subnet.PUB-SUBNET-1.id
  vpc_security_group_ids = [aws_security_group.egproject_sg.id]
  user_data              = file("web.sh")
  tags = {
    Name = "egproject"
  }
}

output "PublicIP" {
  value = aws_instance.egprojectweb.public_ip
}
