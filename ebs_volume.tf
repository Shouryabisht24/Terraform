resource "aws_ebs_volume" "test_storage" {
  availability_zone = "us-west-2a"
  size              = 40

  }

resource "aws_volume_attachment" "ebs_att" {
  device_name = "/dev/sdh"
  volume_id   = aws_ebs_volume.test_storage.id
  instance_id = aws_instance.testinstance.id
}

