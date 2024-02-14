variable "ami" {
  type        = string
  description = "AMI of EC2 instance"
  default     = "ami-0596d807260f25fc1"
}

variable "instance_type" {
  type        = string
  description = "InstanceType"
  default     = "t2.micro"
}

variable "tags" {
  type = map(any)
  default = {
    "name" = "acs730"
    "Env"  = "dev"
  }
}