module "vpc" {
  source            = "../module/aws-subnets"
  vpc_id            = data.aws_vpc.vpc_id.id
  availability_zone = "ap-southeast-1b"
  subnet_cidr_block = "10.148.70.128/27"
  additional_tags   = {}
}

# downloader-1
module "server" {
  source               = "../aws-modules/aws-instance"
  ami                  = "ami-06acd7cbe65da0fde"
  availability_zone    = "ap-southeast-1b"
  instance_type        = "c4.xlarge"
  key_name             = "karthi"
  subnet_id            = module.server.subnet_id
  vpc_id               = data.aws_vpc.vpc_id.id
  security_group_name  = "flask-app-server-security-group"

  additional_tags = {
    "Application" = "flaskapp"
    "Name"        = "Flask-app-server"
    "Type"        = "Instance"
  }
  ingress_rule = {
    "22" = ["0.0.0.0/0"]
    "80"   = ["0.0.0.0/0"]
  }
}