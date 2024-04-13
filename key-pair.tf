resource "tls_private_key" "jenkins_key" {
  algorithm   = "RSA"
  rsa_bits    = 2048
}
resource "aws_key_pair" "jenkins_key" {
  key_name   = "jenkins-key"
  public_key = tls_private_key.jenkins_key.public_key_openssh
}
# Save file
resource "local_file" "ssh_key" {
  filename = "jenkins-key.pem"
  content  = tls_private_key.jenkins_key.private_key_pem
}