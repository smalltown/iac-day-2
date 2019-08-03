# Terragrunt is a thin wrapper for Terraform that provides extra tools for working with multiple Terraform modules,
# remote state, and locking: https://github.com/gruntwork-io/terragrunt

# Configure Terragrunt to automatically store tfstate files in an S3 bucket

#remote_state {
#  backend = "s3"
#
#  config {
#    encrypt        = true
#    bucket         = "central.tfstate-1234567890123"
#    key            = "basic/${path_relative_to_include()}/terraform.tfstate"
#    region         = "us-east-1"
#    dynamodb_table = "central.tfstate-1234567890123"
#  }
#}

# Configure root level variables that all resources can inherit
terraform {
  extra_arguments "load_vars" {
    commands = get_terraform_commands_that_need_vars()

    required_var_files = [
      "${get_parent_terragrunt_dir()}/common.tfvars"
    ]

    optional_var_files = [
      "read.tfvars",
      "write.tfvars",
    ]
  }
}