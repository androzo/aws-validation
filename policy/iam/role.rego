package iam.role

import rego.v1

default deny = []

# Validate the IAM role uses a permissions boundary
deny[msg] {
  input.resource_type == "aws_iam_role"
  not input.permissions_boundary
  msg := sprintf("Role '%s' must have a permissions boundary", [input.name])
}

# Validate that the 'Team' tag exists
deny[msg] {
  input.resource_type == "aws_iam_role"
  not input.tags["Team"]
  msg := sprintf("Role '%s' must have a 'Team' tag", [input.name])
}