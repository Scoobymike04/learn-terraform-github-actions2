resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.SalsaSunday.id

  tags = {
    Name    = "SalsaSunday_IG"
    Service = "application1"
    Owner   = "Luke"
    Planet  = "Musafar"
  }
}
