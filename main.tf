resource "aws_instance" "jenkis-instance" {
    ami = "ami-0d7a109bf30624c99"
    instance_type = "t2.micro"
    key_name = "jenkins-key"
    vpc_security_group_ids = [ aws_security_group.jenkins_sg.id ]

    subnet_id = aws_subnet.public_subnet.id
    user_data =file("install.sh")

}
resource "aws_route53_record" "jenkins-record" {
    zone_id = "Z07414952BIJ2RQK7BQ5F"
    name = "jenkins.riveha.com"
    type = "A"
    ttl = "300"
    records = [ aws_instance.jenkis-instance.public_ip ]
  
}

output "dns-name" {
  value = aws_route53_record.jenkins-record.name
}