
locals {
    #argument = "To login on instance ${each_instance.tags["Name"]} please use:"
    argument = "To login on instance please use:"
}

output "ec2_ssh_login" {
    #value = " ssh -i ${var.ssh-key-name}.pem ec2-user@${aws_instance.first_ec2_instance[0].public_ip}"
    value = [for each_instance in aws_instance.first_ec2_instance: "${local.argument}  'ssh -i ${var.ssh-key-name}.pem ec2-user@${each_instance.public_ip}' and get access of ${each_instance.tags["Name"]}" ]
}

output "ec2_ssh_login_dns" {
    #value = "ssh -i ${var.ssh-key-name}.pem ec2-user@${aws_instance.first_ec2_instance[0].public_dns}"
    value = [for each_instance in aws_instance.first_ec2_instance: "${local.argument} 'ssh -i ${var.ssh-key-name}.pem ec2-user@${each_instance.public_dns}' and get access of ${each_instance.tags["Name"]}" ]
}
