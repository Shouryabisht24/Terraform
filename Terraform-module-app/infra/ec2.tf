resource "aws_key_pair" "key" {
  key_name   = "${var.env}-my-key"
  public_key = file("ssh-key.pub")
}

resource "aws_security_group" "my-sg" {
  name        = "${var.env}-security-group"
  description = "Allow SSH and HTTP traffic"
  vpc_id      = aws_vpc.vpc-main.id

  ingress {
    description = "port 22 allow"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    description = " allow all outgoing traffic "
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "port 80 allow"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "port 443 allow"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name        = "mysecurity-sg"
    environment = var.env
  }
}


resource "aws_instance" "linux" {
  count                       = 2
  depends_on                  = [aws_security_group.my-sg]
  ami                         = var.ami
  instance_type               = var.instance_type
  key_name                    = aws_key_pair.key.key_name
  subnet_id                   = aws_subnet.subnet-1.id
  vpc_security_group_ids      = [aws_security_group.my-sg.id]
  associate_public_ip_address = true



  tags = {
    Name = "${var.env}-app-server-${count.index + 1}"
  }

  root_block_device {
    volume_size = "20"
    volume_type = "gp3"
  }
}