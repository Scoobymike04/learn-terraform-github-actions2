# this  makes  vpc.id which is aws_vpc.app1.id
resource "aws_vpc" "SalsaSunday" {
  cidr_block = "10.20.0.0/16"

  tags = {
    Name    = "SalsaSunday"
    Service = "application1"
    Owner   = "Chewbacca"
    Planet  = "Mustafar"
  }
}
