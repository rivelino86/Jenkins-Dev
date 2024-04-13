resource "aws_security_group" "jenkins_sg" {
    name = "mafar-sg"
    description = "allow ssh and httpd"
    vpc_id = aws_vpc.my_vpc.id

ingress  {
    description = "allow ssh"
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = [ "69.9.101.228/32"]
}
  
  ingress  {
    description = "allow httpd"
        from_port = 80
        to_port = 80
        protocol = "tcp"
        cidr_blocks = [ "0.0.0.0/0"]
       
  }

   ingress {
    description = "allow httpd"
        from_port = 8080
        to_port = 8080
        protocol = "tcp"
        cidr_blocks = [ "0.0.0.0/0"]
  }
  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }


  
}