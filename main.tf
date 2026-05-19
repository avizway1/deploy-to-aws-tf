provider "aws" {
  region = "ap-south-1"
}

resource "aws_instance" "mywebserver" {
  count         = 2
  ami           = "ami-01b40e1bcccae197a"
  instance_type = "t3.micro"

  tags = {
    Name = "MyWeb-Server"
  }
}
