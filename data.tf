data "aws_availability_zones" "available" {}

################ Ubuntu AMI lookup ###################

data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}

output "ami_id" {

  value = data.aws_ami.ubuntu.id
}


data "aws_route53_zone" "heder_lab_zone" {
  name = var.zone

}

output "zone_id" {
  value = data.aws_route53_zone.heder_lab_zone.id

}

data "aws_eip" "bastion_eip" {
  public_ip = "18.189.113.127"
}

output "allocation_id" {
  value = data.aws_eip.bastion_eip.id

}

