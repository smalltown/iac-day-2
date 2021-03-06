# ---------------------------------------------------------------------------------------------------------------------
# TERRAGRUNT CONFIGURATION
# This is the configuration for Terragrunt, a thin wrapper for Terraform that supports locking and enforces best
# practices: https://github.com/gruntwork-io/terragrunt
# ---------------------------------------------------------------------------------------------------------------------

# Terragrunt will copy the Terraform configurations specified by the source parameter, along with any files in the
# working directory, into a temporary folder, and execute your Terraform commands in that folder.
terraform {
  source = "github.com/smalltown/tf-aws-iam//modules/roles?ref=v0.0.2"
}

# Include all settings from the root *.tfvars file
include {
  path = find_in_parent_folders()
}

inputs = {
  central_account_id = "1234567890123"
  account_alias = "central"
  MFAge = "28800"
  read_account_name = "read"
  write_account_name = "write"
  robot_account_name = "atlantis"
}

