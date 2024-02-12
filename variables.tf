variable "availability_zones" {
  description = "List of availability zones for creating subnets"
  type        = list(string)
  default     = ["us-east-1a", "us-east-1b"] # Or any desired availability zones
}