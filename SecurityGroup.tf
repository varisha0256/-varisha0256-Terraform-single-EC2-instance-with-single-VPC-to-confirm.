resource "aws_security_group" "TF_SG" {
    name = "TF_SG"
    description = "to reach the EC2 instance from anywhere"
    vpc_id = aws_vpc.TF_VPC.id
    
    ingress{
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
    egress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }
}
