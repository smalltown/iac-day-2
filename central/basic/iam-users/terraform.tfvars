# ---------------------------------------------------------------------------------------------------------------------
# TERRAGRUNT CONFIGURATION
# This is the configuration for Terragrunt, a thin wrapper for Terraform that supports locking and enforces best
# practices: https://github.com/gruntwork-io/terragrunt
# ---------------------------------------------------------------------------------------------------------------------

terragrunt = {
  # Terragrunt will copy the Terraform configurations specified by the source parameter, along with any files in the
  # working directory, into a temporary folder, and execute your Terraform commands in that folder.
  terraform {
    source = "github.com/smalltown/tf-aws-iam//modules/users?ref=v0.0.1"
  }

  # Include all settings from the root terraform.tfvars file
  include = {
    path = "${find_in_parent_folders()}"
  }
}

human_accounts = []
read_group_name = "read"
write_group_name = "write"
robot_group_name = "robot"
robot_account_name = "atlantis"

account_id_mapping = {
    centeral    = "1234567890123"
    development = "2345678901234"
    staging     = "3456789012345"
    production  = "4567890123456"
}