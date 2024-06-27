resource "aws_instance" "first_ec2_instance" {
   ami = data.aws_ami.amazonlinux2.id
   instance_type = "t2.micro"
   key_name = var.ssh-key-name
   subnet_id = aws_subnet.vpc-A-public-sub-1.id
   #security_groups = [ aws_security_group.ec2_ssh_myip_access.id ]   ## this is creating problem and it recreating ec2 instance
   vpc_security_group_ids = [aws_security_group.ec2_ssh_myip_access.id]
   count = 1

   tags = {
     Name = "demo-instance-${count.index}"
   }
}