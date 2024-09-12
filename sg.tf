resource "aws_security_group" "allow_all_SSH" {
  name        = "allow_all_SSH"
  description = "Allow SSH inbound traffic"
  vpc_id      = module.vpc.vpc_id

  ingress {
    description = "SSH from all"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "allow_all_ssh"
  }
}

resource "aws_security_group" "allow_all_wg" {
  name        = "allow_all_wg"
  description = "Allow wg inbound traffic"
  vpc_id      = module.vpc.vpc_id

  ingress {
    description = "wg from all"
    from_port   = 51820
    to_port     = 51820
    protocol    = "udp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "allow_all_wg"
  }
}