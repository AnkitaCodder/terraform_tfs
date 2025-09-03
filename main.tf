provider "aws" {
region = "us-east-2"
access_key = ""
secret_key = ""
}

resource "aws_instance" "assign_2" {
ami = "ami-0360c520857e3138f"
instance_type = "t2.micro"
key_name = "terra_key"
tags = {
Name = "assignment-2"
}
}


resource "aws_eip" "eip"{
}

resource "aws_eip_association" "eip_assoc"{
instance_id = aws_instance.assign_2.id
allocation_id = aws_eip.eip.id
}
