variable "aws_access_key" {
  
}

variable "aws_secret_key" {
  
}

variable "aws_region" {
  default = "us-east-1"  
}

variable "namespace" {
 default = "sqsredis" 
}

variable "cluster_id" {
  default = "cluster"
}

variable "node_groups" {
  description = "number of replics in node group of Redis"
  default = 3
}

variable "vpc_cidr_block" {
  description = "The top-level CIDR block for the VPC."
  default     = "10.1.0.0/16"
}

variable "cidr_blocks" {
  description = "The CIDR blocks to create the workstations in."
  default     = ["10.1.1.0/24", "10.1.2.0/24"]
}

variable "path_pem" {
  default = "~/.ssh/sqsredis.pem"  
}