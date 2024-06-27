resource "aws_security_group" "ec2_ssh_myip_access" {
    name = "ec2_ssh_myip_access"
    vpc_id = aws_vpc.vpc-A.id
    description = "This security group is allow only my public ip address ssh access..."

    tags = {
      Name = "ec2_ssh_myip_access"
    }
}

resource "aws_vpc_security_group_ingress_rule" "allow_ssh_to_myip" {
    security_group_id = aws_security_group.ec2_ssh_myip_access.id
    cidr_ipv4 = "0.0.0.0/0"
    from_port = 22
    ip_protocol = "tcp"
    to_port = 22
}

resource "aws_vpc_security_group_egress_rule" "allow_all_outbound_traffic" {
    security_group_id = aws_security_group.ec2_ssh_myip_access.id
    cidr_ipv4 = "0.0.0.0/0"
    ip_protocol = "-1"
  
}