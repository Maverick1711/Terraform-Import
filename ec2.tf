

provider "aws" {
      region = "us-east-1"
      profile = "new-user"

}


resource "aws_instance" "test-instance" {
     ami                                  = "ami-02f3f602d23f1659d"

    
    availability_zone                    = "us-east-1a"
    instance_type                        = "t2.micro"
    key_name                             = "host-key"
    security_groups                      = [
        aws_security_group.ec2_sg.id,
    ]
    subnet_id                            = "subnet-0e7c42cab4be90d86"
    tags                                 = {
        "Name" = "test-instance"
    }
    tags_all                             = {
        "Name" = "test-instance"
    }
    
    }


resource "aws_security_group" "ec2_sg" {
     
    description = "test-secgrp"
    egress      = [
        {
            cidr_blocks      = [
                "0.0.0.0/0",
            ]
            description      = ""
            from_port        = 0
            ipv6_cidr_blocks = []
            prefix_list_ids  = []
            protocol         = "-1"
            security_groups  = []
            self             = false
            to_port          = 0
        },
    ]
    ingress     = [
        {
            cidr_blocks      = [
                "0.0.0.0/0",
            ]
            description      = ""
            from_port        = 22
            ipv6_cidr_blocks = []
            prefix_list_ids  = []
            protocol         = "tcp"
            security_groups  = []
            self             = false
            to_port          = 22
        },
    ]
    name        = "test-secgrp"
    vpc_id      = "vpc-02fcb2d4f5038286e"
}
  
