provider "aws" {
  region = "ap-south-1"
}

terraform {
  backend "s3" {
    bucket       = "aviz.tf.state.myproject"
    key          = "cicd/terraform.tfstate"
    region       = "ap-south-1"
    use_lockfile = true
  }
}

resource "aws_instance" "webserver" {
  count         = 1
  ami           = "ami-00d2dbb426772b03a"
  instance_type = "t3.micro"

  tags = {
    Name = "cicd-tf-demo"
  }
}
