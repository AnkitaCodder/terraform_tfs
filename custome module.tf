module "terra-infra" {
    source = "./infra-app"
    env = "dev"
    instance_count = 1
    instance_type = "t2.micro"
    ami_id = "ami-0360c520857e3138f"
    hash_key = "StudentID"



  
}

module "prd-infra" {
    source = "./infra-app"
    env = "prd"
    instance_count = 1
    instance_type = "t2.medium"
    ami_id = "ami-0360c520857e3138f"
    hash_key = "StudentID"



  
}


module "stg-infra" {
    source = "./infra-app"
    env = "stg"
    instance_count = 1
    instance_type = "t2.small"
    ami_id = "ami-0360c520857e3138f"
    hash_key = "StudentID"



  
}
