provider "aws" {
  region = "ap-south-1"
}

terraform {
  backend "s3" {
    bucket = "aviz-tfstate-bucket"
    key = "myprodstate/terraform.tfstate"
    region = "ap-south-1"
    use_lockfile = true
  }
}

resource "aws_instance" "mywebserver" {
  count         = 1
  ami           = "ami-01b40e1bcccae197a"
  instance_type = "t3.micro"

  tags = {
    Name = "MyWeb-Server"
  }
}
