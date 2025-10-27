# Subnet Terragrunt file that includes inheritance configuration paths and input variables to the resource

include "root" {
  path = find_in_parent_folders("root.hcl")
}

include "envcommon" {
  path = "${get_repo_root()}/_envcommon/subnet.hcl"
  expose = true
}


locals {}

inputs = {
  vpc_id = "" #  Manually add an existing VPC ID not managed by Terragrunt
  cidr_block = "10.0.0.0/16"
  region = "us-east-1"
  tags = {
    Name = "example-subnet"
    Project = "Demo"
    Environment = "test"
    ManagedBy = "Terraform"
  }
}