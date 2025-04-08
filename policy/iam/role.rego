package main

import rego.v1

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
  "abacate"
}


# deny if resource is not tagged and is not in non_taggable
deny contains msg if {
    changeset := input.resource_changes[_]
    # Ignore if block is data 
    split(changeset.address, ".")[0] != "data"
    changeset.change.after.tags_all

    # ignore non-taggable resources
    not changeset.type in non_taggable

    # ignore modules
    not startswith(changeset.address, "module")

    provided_tags := {tag | changeset.change.after.tags_all[tag]}
    missing_tags := required_tags - provided_tags

    count(missing_tags) > 0

    msg := sprintf("%v is missing required tags: %v", [
      changeset.address,
      concat(", ", missing_tags),
    ])
}