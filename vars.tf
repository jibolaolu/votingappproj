variable "servicename" {
  default = "finalProject"
}
variable "vpc_cidr" {
  default = "10.7.0.0/16"
}
variable "publicsubnet_cidr" {
  default = "10.7.1.0/24"
}

variable "privatesubnet_cidr1" {
  description = "Private Subnet in Eu-west-2a for Voting App"
  default     = "10.7.2.0/24"
}

variable "privatesubnet_cidr2" {
  description = "Private Subnet in Eu-west-2a for Redis"
  default     = "10.7.3.0/24"
}

variable "privatesubnet_cidr3" {
  description = "Private Subnet in Eu-west-2b for Voting App"
  default     = "10.7.4.0/24"
}

variable "privatesubnet_cidr4" {
  description = "Private Subnet in Eu-west-2b for Redis"
  default     = "10.7.5.0/24"
}

variable "availability_zone2" {
  default = "eu-west-2b"
}

variable "availability_zone1" {
  default = "eu-west-2a"
}

variable "ami-id" {
  description = "all ec2 instance will be using this ami"
  default     = "ami-0435914201bf700c1"
}

variable "instance_type" {
  default = "t2.micro"
}

variable "keypair" {
  default = "LinuxKeyPair"
}