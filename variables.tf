variable "region" {
    default = "us-east-1"
    type = string
    description = "this is the default n-virginia region"
}

variable "ssh-key-name" {
    default = "terraform-key"
    type = string
}