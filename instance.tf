resource "aws_instance" "EC2_with_TF" {
    ami = "ami-0ab4d1e9cf9a1215a"
    instance_type = "t2.micro"
    key_name = "${var.key_name}"
#    availability_zone = "us-east-1"
#    vpc = aws_vpc.TF_VPC.id
    subnet_id = aws_subnet.demo_subnet-1.id
    vpc_security_group_ids=[aws_security_group.TF_SG.id]
    associate_public_ip_address = true

    tags = {
        Name = "EC2_with_VPC_using_TF"
    }
}