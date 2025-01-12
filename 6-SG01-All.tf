resource "aws_security_group" "SalsaSunday-TG01-SG01-80" {
  name        = "SalsaSunday-TG01-SG01-80"
  description = "SalsaSunday-TG01-SG01-80"
  vpc_id      = aws_vpc.SalsaSunday.id

  ingress {
    description = "MyHomePage"
    from_port   = 80
    to_port     = 80
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
    Name    = "TG01-SG01-80-servers"
    Service = "application1"
    Owner   = "Luke"
    Planet  = "Musafar"
  }

}





resource "aws_security_group" "SalsaSunday-LB01-SG01" {
  name        = "SalsaSunday-sg02-LB01"
  description = "SalsaSunday-sg02-LB01"
  vpc_id      = aws_vpc.SalsaSunday.id

  ingress {
    description = "MyHomePage"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "Secure"
    from_port   = 443
    to_port     = 443
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
    Name    = "SalsaSunday-SalsaSunday-LB01-SG01"
    Service = "application1"
    Owner   = "Luke"
    Planet  = "Musafar"
  }

}


resource "aws_security_group" "SalsaSunday-TG02-SG01-443" {
  name        = "SalsaSunday-TG02-SG01-443"
  description = "SalsaSunday-TG02-SG01-443"
  vpc_id      = aws_vpc.SalsaSunday.id

  ingress {
    description = "MyHomePage"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "Secure"
    from_port   = 443
    to_port     = 443
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
    Name    = "SalsaSunday-TG02-SG01-443"
    Service = "application1"
    Owner   = "Luke"
    Planet  = "Musafar"
  }

}
