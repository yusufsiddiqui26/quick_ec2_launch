variable "region" {
    default = "us-east-1"
    type = string
    description = "this is the default n-virginia region"
}

variable "ssh-key-name" {
    default = "terraform-key"
    type = string
}

variable "instance_type_list" {
    type = list(string)
    default = ["t2.micro"]
}

variable "instance_type_map" {
    type = map(string)
    default = {
      "test" = "t3.micro"
    }
  
}