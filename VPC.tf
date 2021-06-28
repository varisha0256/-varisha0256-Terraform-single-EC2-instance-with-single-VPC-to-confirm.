resource "aws_vpc" "TF_VPC"{
    cidr_block = "${var.vpc_cidr}"

    tags = {
        Name = "${var.vpc_name}"
    }
}

resource "aws_internet_gateway" "testGW" {
    vpc_id = aws_vpc.TF_VPC.id

    tags = {
        Name = "${var.IGW_name}"
    }
}

resource "aws_subnet" "demo_subnet-1"{
    vpc_id = aws_vpc.TF_VPC.id
    map_public_ip_on_launch = true
    cidr_block = "${var.public_subnet1_cidr}"

    tags = {
        Name = "${var.public_subnet1_name}"
    }
}

resource "aws_route_table" "route-public" {
    vpc_id = aws_vpc.TF_VPC.id

    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.testGW.id
    }

    tags = {
        Name = "${var.Main_Routing_Table}"
    }
}

resource "aws_route_table_association" "TF_route" {
    subnet_id = aws_subnet.demo_subnet-1.id
    route_table_id = aws_route_table.route-public.id
}
