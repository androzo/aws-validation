package main

# Set of resource types that do NOT accept tags
non_taggable := {
    "aws_iam_role_policy_attachment",
    "aws_iam_user_policy_attachment",
    "aws_iam_group_policy_attachment",
    "aws_route_table_association",
    "aws_network_acl_association",
    "aws_network_acl_rule",
    "aws_security_group_rule",
    "aws_lb_target_group_attachment",
    "aws_iam_instance_profile"
}

# Only check resources that accept tags.
taggable(resource) {
    t := resource.type
    not (t in non_taggable)
}

# Define the required tags (all in lowercase)
required_tags := {"team", "abacate"}

# Given a resource from the Terraform plan, extract missing required tags.
missing_tags(resource) := { tag |
  tag := required_tags[_]
  not resource_has_tag(resource, tag)
}

# Check if the resource has a specific tag in its "after" configuration.
resource_has_tag(resource, tag) {
  resource.change.after.tags[tag]
}

# Deny any resource that is missing any of the required tags.
deny[msg] {
  resource := input.resource_changes[_]
  # Only check resources whose type starts with "aws_"
  taggable(resource)
  missing := missing_tags(resource)
  count(missing) > 0
  msg := sprintf("AWS resource %q is missing required tags: %v", [resource.address, missing])
}