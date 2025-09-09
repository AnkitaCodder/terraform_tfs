resource "aws_s3_bucket" "remotebucket" {
  bucket = "ankita-tf-bucket"

  tags = {
    Name        = "ankita-tf-bucket"
  }
}
