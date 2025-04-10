package terraform

import rego.v1

# This policy checks if the required tags are present in the resource changes
# and denies the changes if any required tag is missing.
# It also ignores certain resource types that do not accept tags and modules.

default allow := false 

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


# Define the required tags (all in lowercase)
required_tags := {
  "team",
  "Name"
}

# deny if resource is not tagged and is not in non_taggable
violations contains msg if {
    some changeset in input.resource_changes
    # Ignore if block is data 
    split(changeset.address, ".")[0] != "data"
    changeset.change.after.tags_all

    # ignore non-taggable resources
    not changeset.type in non_taggable

    # ignore modules
    not startswith(changeset.address, "module")

    provided_tags := {tag | some tag in object.keys(changeset.change.after.tags_all)}
    missing_tags := required_tags - provided_tags

    count(missing_tags) > 0

    msg := sprintf("Violation: %v is missing required tags: %v", [
      changeset.address,
      concat(", ", missing_tags),
    ])
}

# violations := [msg | msg := deny[_]]

allow := count(violations) == 0
