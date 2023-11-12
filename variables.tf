variable "number_of_instances" {
  description = "Number of instances to create and attach to ELB"
  type        = string
  default     = 1
}
#Security groups
variable "public_sg" {
  type    = string
  default = "prod-public-sg"
}
variable "private_sg" {
  type    = string
  default = "prod-private-sg"
}
variable "bastion_sg" {
  type    = string
  default = "prod-bastion-sg"
}

#Domain name
variable "domain_name" {
  type    = string
  default = "hederdevops.com"
}
variable "prod_domain_name" {
  type    = string
  default = "www.hederdevops.com"
}

variable "stage_domain_name" {
  type    = string
  default = "www.stage.hederdevops.com"
}
variable "host_header_stage_domain_name" {
  type    = string
  default = "stage.hederdevops.com"
}
variable "qa_domain_name" {
  type    = string
  default = "www.qa.hederdevops.com"
}
variable "host_header_qa_domain_name" {
  type    = string
  default = "qa.hederdevops.com"
}

variable "host_domain_name" {
  type    = string
  default = "hederdevops.com"
}

#health path
variable "health_path" {
  type    = string
  default = "/health.html"
}
#key
variable "key_name" {
  type    = string
  default = "main-us-east-2"
}


variable "base-role" {
  type    = string
  default = "base-ec2-role-1"
}

#zone name
variable "zone" {
  type    = string
  default = "hederdevops.com"
}
#bastion
variable "bastion" {
  type    = string
  default = "prod-bastion"
}


