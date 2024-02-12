resource "aws_instance" "web_servers" {
  count           = 3
  ami             = "ami-12345678" # Your desired AMI
  instance_type   = "t3.micro"     # Changed instance type to t3.micro
  subnet_id       = var.subnet_id
  security_groups = [var.security_group_id]

  root_block_device {
    volume_type           = "gp3" # Using gp3 volume type
    volume_size           = 20    # Size of the volume in GiB
    delete_on_termination = true
  }
}