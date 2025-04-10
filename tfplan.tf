{
    "format_version": "1.2",
    "terraform_version": "1.10.5",
    "variables": {
        "aws_region": {
            "value": "sa-east-1"
        },
        "environment": {
            "value": "devl"
        },
        "team_account": {
            "value": "396608777381"
        },
        "team_name": {
            "value": "team-anders"
        }
    },
    "planned_values": {
        "root_module": {
            "resources": [
                {
                    "address": "aws_iam_policy.deployment_policy",
                    "mode": "managed",
                    "type": "aws_iam_policy",
                    "name": "deployment_policy",
                    "provider_name": "registry.terraform.io/hashicorp/aws",
                    "schema_version": 0,
                    "values": {
                        "description": "Policy granting access to  resources tagged with Team=team-anders",
                        "name": "team-anders-deployment-policy",
                        "path": "/deployment-policies/",
                        "policy": "{\"Statement\":[{\"Action\":\"s3:*\",\"Condition\":{\"StringEquals\":{\"aws:RequestTag/team\":\"team-anders\"}},\"Effect\":\"Allow\",\"Resource\":\"*\"},{\"Action\":\"s3:ListBucket\",\"Condition\":{\"StringEquals\":{\"s3:ResourceTag/team\":\"team-anders\"}},\"Effect\":\"Allow\",\"Resource\":\"*\"}],\"Version\":\"2012-10-17\"}",
                        "tags": {
                            "Name": "team-anders-deployment-policy",
                            "environment": "devl",
                            "team": "devops"
                        },
                        "tags_all": {
                            "Name": "team-anders-deployment-policy",
                            "environment": "devl",
                            "team": "devops"
                        }
                    },
                    "sensitive_values": {
                        "tags": {},
                        "tags_all": {}
                    }
                },
                {
                    "address": "aws_iam_role.deployment_role",
                    "mode": "managed",
                    "type": "aws_iam_role",
                    "name": "deployment_role",
                    "provider_name": "registry.terraform.io/hashicorp/aws",
                    "schema_version": 0,
                    "values": {
                        "assume_role_policy": "{\"Statement\":[{\"Action\":\"sts:AssumeRoleWithWebIdentity\",\"Condition\":{\"StringEquals\":{\"token.actions.githubusercontent.com:aud\":\"sts.amazonaws.com\"},\"StringLike\":{\"token.actions.githubusercontent.com:sub\":\"repo:androzo/team-anders-*/environment:devl\"}},\"Effect\":\"Allow\",\"Principal\":{\"Federated\":\"arn:aws:iam::396608777381:oidc-provider/token.actions.githubusercontent.com\"}}],\"Version\":\"2012-10-17\"}",
                        "description": null,
                        "force_detach_policies": false,
                        "max_session_duration": 3600,
                        "name": "team-anders-deployment-role",
                        "path": "/deployment-roles/",
                        "tags": {
                            "Name": "team-anders-deployment-role",
                            "environment": "devl",
                            "team": "devops"
                        },
                        "tags_all": {
                            "Name": "team-anders-deployment-role",
                            "environment": "devl",
                            "team": "devops"
                        }
                    },
                    "sensitive_values": {
                        "inline_policy": [],
                        "managed_policy_arns": [],
                        "tags": {},
                        "tags_all": {}
                    }
                },
                {
                    "address": "aws_iam_role_policy_attachment.attach_deployment_policy",
                    "mode": "managed",
                    "type": "aws_iam_role_policy_attachment",
                    "name": "attach_deployment_policy",
                    "provider_name": "registry.terraform.io/hashicorp/aws",
                    "schema_version": 0,
                    "values": {
                        "role": "team-anders-deployment-role"
                    },
                    "sensitive_values": {}
                }
            ],
            "child_modules": [
                {
                    "resources": [
                        {
                            "address": "module.iam_permission_boundary.aws_iam_policy.boundary",
                            "mode": "managed",
                            "type": "aws_iam_policy",
                            "name": "boundary",
                            "provider_name": "registry.terraform.io/hashicorp/aws",
                            "schema_version": 0,
                            "values": {
                                "description": "Permissions boundary for deployment roles",
                                "name": "team-anders-deployment-permission-boundary",
                                "path": "/permission-boundaries/",
                                "policy": "{\"Statement\":[{\"Action\":\"*\",\"Condition\":{\"StringNotEquals\":{\"aws:ResourceTag/Team\":\"team-anders\"}},\"Effect\":\"Deny\",\"Resource\":\"*\"},{\"Action\":[\"iam:Delete*\",\"iam:UpdateAssumeRolePolicy\",\"iam:PutRolePermissionsBoundary\",\"organizations:*\",\"account:*\"],\"Effect\":\"Deny\",\"Resource\":\"*\",\"Sid\":\"DenyDangerousActions\"},{\"Action\":\"iam:PassRole\",\"Condition\":{\"ArnNotLikeIfExists\":{\"aws:PrincipalArn\":\"arn:aws:iam::*:role/team-anders-deployment-role\"},\"StringNotLike\":{\"iam:PassedToService\":[\"ec2.amazonaws.com\",\"lambda.amazonaws.com\",\"ecs-tasks.amazonaws.com\"]}},\"Effect\":\"Deny\",\"Resource\":\"*\",\"Sid\":\"ConditionalPassRole\"}],\"Version\":\"2012-10-17\"}",
                                "tags": {
                                    "Name": "team-anders-deployment-permission-boundary",
                                    "Team": "devops"
                                },
                                "tags_all": {
                                    "Name": "team-anders-deployment-permission-boundary",
                                    "Team": "devops"
                                }
                            },
                            "sensitive_values": {
                                "tags": {},
                                "tags_all": {}
                            }
                        }
                    ],
                    "address": "module.iam_permission_boundary"
                }
            ]
        }
    },
    "resource_changes": [
        {
            "address": "aws_iam_policy.deployment_policy",
            "mode": "managed",
            "type": "aws_iam_policy",
            "name": "deployment_policy",
            "provider_name": "registry.terraform.io/hashicorp/aws",
            "change": {
                "actions": [
                    "create"
                ],
                "before": null,
                "after": {
                    "description": "Policy granting access to  resources tagged with Team=team-anders",
                    "name": "team-anders-deployment-policy",
                    "path": "/deployment-policies/",
                    "policy": "{\"Statement\":[{\"Action\":\"s3:*\",\"Condition\":{\"StringEquals\":{\"aws:RequestTag/team\":\"team-anders\"}},\"Effect\":\"Allow\",\"Resource\":\"*\"},{\"Action\":\"s3:ListBucket\",\"Condition\":{\"StringEquals\":{\"s3:ResourceTag/team\":\"team-anders\"}},\"Effect\":\"Allow\",\"Resource\":\"*\"}],\"Version\":\"2012-10-17\"}",
                    "tags": {
                        "Name": "team-anders-deployment-policy",
                        "environment": "devl",
                        "team": "devops"
                    },
                    "tags_all": {
                        "Name": "team-anders-deployment-policy",
                        "environment": "devl",
                        "team": "devops"
                    }
                },
                "after_unknown": {
                    "arn": true,
                    "attachment_count": true,
                    "id": true,
                    "name_prefix": true,
                    "policy_id": true,
                    "tags": {},
                    "tags_all": {}
                },
                "before_sensitive": false,
                "after_sensitive": {
                    "tags": {},
                    "tags_all": {}
                }
            }
        },
        {
            "address": "aws_iam_role.deployment_role",
            "mode": "managed",
            "type": "aws_iam_role",
            "name": "deployment_role",
            "provider_name": "registry.terraform.io/hashicorp/aws",
            "change": {
                "actions": [
                    "create"
                ],
                "before": null,
                "after": {
                    "assume_role_policy": "{\"Statement\":[{\"Action\":\"sts:AssumeRoleWithWebIdentity\",\"Condition\":{\"StringEquals\":{\"token.actions.githubusercontent.com:aud\":\"sts.amazonaws.com\"},\"StringLike\":{\"token.actions.githubusercontent.com:sub\":\"repo:androzo/team-anders-*/environment:devl\"}},\"Effect\":\"Allow\",\"Principal\":{\"Federated\":\"arn:aws:iam::396608777381:oidc-provider/token.actions.githubusercontent.com\"}}],\"Version\":\"2012-10-17\"}",
                    "description": null,
                    "force_detach_policies": false,
                    "max_session_duration": 3600,
                    "name": "team-anders-deployment-role",
                    "path": "/deployment-roles/",
                    "tags": {
                        "Name": "team-anders-deployment-role",
                        "environment": "devl",
                        "team": "devops"
                    },
                    "tags_all": {
                        "Name": "team-anders-deployment-role",
                        "environment": "devl",
                        "team": "devops"
                    }
                },
                "after_unknown": {
                    "arn": true,
                    "create_date": true,
                    "id": true,
                    "inline_policy": true,
                    "managed_policy_arns": true,
                    "name_prefix": true,
                    "permissions_boundary": true,
                    "tags": {},
                    "tags_all": {},
                    "unique_id": true
                },
                "before_sensitive": false,
                "after_sensitive": {
                    "inline_policy": [],
                    "managed_policy_arns": [],
                    "tags": {},
                    "tags_all": {}
                }
            }
        },
        {
            "address": "aws_iam_role_policy_attachment.attach_deployment_policy",
            "mode": "managed",
            "type": "aws_iam_role_policy_attachment",
            "name": "attach_deployment_policy",
            "provider_name": "registry.terraform.io/hashicorp/aws",
            "change": {
                "actions": [
                    "create"
                ],
                "before": null,
                "after": {
                    "role": "team-anders-deployment-role"
                },
                "after_unknown": {
                    "id": true,
                    "policy_arn": true
                },
                "before_sensitive": false,
                "after_sensitive": {}
            }
        },
        {
            "address": "module.iam_permission_boundary.aws_iam_policy.boundary",
            "module_address": "module.iam_permission_boundary",
            "mode": "managed",
            "type": "aws_iam_policy",
            "name": "boundary",
            "provider_name": "registry.terraform.io/hashicorp/aws",
            "change": {
                "actions": [
                    "create"
                ],
                "before": null,
                "after": {
                    "description": "Permissions boundary for deployment roles",
                    "name": "team-anders-deployment-permission-boundary",
                    "path": "/permission-boundaries/",
                    "policy": "{\"Statement\":[{\"Action\":\"*\",\"Condition\":{\"StringNotEquals\":{\"aws:ResourceTag/Team\":\"team-anders\"}},\"Effect\":\"Deny\",\"Resource\":\"*\"},{\"Action\":[\"iam:Delete*\",\"iam:UpdateAssumeRolePolicy\",\"iam:PutRolePermissionsBoundary\",\"organizations:*\",\"account:*\"],\"Effect\":\"Deny\",\"Resource\":\"*\",\"Sid\":\"DenyDangerousActions\"},{\"Action\":\"iam:PassRole\",\"Condition\":{\"ArnNotLikeIfExists\":{\"aws:PrincipalArn\":\"arn:aws:iam::*:role/team-anders-deployment-role\"},\"StringNotLike\":{\"iam:PassedToService\":[\"ec2.amazonaws.com\",\"lambda.amazonaws.com\",\"ecs-tasks.amazonaws.com\"]}},\"Effect\":\"Deny\",\"Resource\":\"*\",\"Sid\":\"ConditionalPassRole\"}],\"Version\":\"2012-10-17\"}",
                    "tags": {
                        "Name": "team-anders-deployment-permission-boundary",
                        "Team": "devops"
                    },
                    "tags_all": {
                        "Name": "team-anders-deployment-permission-boundary",
                        "Team": "devops"
                    }
                },
                "after_unknown": {
                    "arn": true,
                    "attachment_count": true,
                    "id": true,
                    "name_prefix": true,
                    "policy_id": true,
                    "tags": {},
                    "tags_all": {}
                },
                "before_sensitive": false,
                "after_sensitive": {
                    "tags": {},
                    "tags_all": {}
                }
            }
        }
    ],
    "configuration": {
        "provider_config": {
            "aws": {
                "name": "aws",
                "full_name": "registry.terraform.io/hashicorp/aws"
            }
        },
        "root_module": {
            "resources": [
                {
                    "address": "aws_iam_policy.deployment_policy",
                    "mode": "managed",
                    "type": "aws_iam_policy",
                    "name": "deployment_policy",
                    "provider_config_key": "aws",
                    "expressions": {
                        "description": {
                            "references": [
                                "var.team_name"
                            ]
                        },
                        "name": {
                            "references": [
                                "var.team_name"
                            ]
                        },
                        "path": {
                            "constant_value": "/deployment-policies/"
                        },
                        "policy": {
                            "references": [
                                "var.team_name",
                                "var.team_name"
                            ]
                        },
                        "tags": {
                            "references": [
                                "var.team_name",
                                "var.environment"
                            ]
                        }
                    },
                    "schema_version": 0,
                    "depends_on": [
                        "module.iam_permission_boundary"
                    ]
                },
                {
                    "address": "aws_iam_role.deployment_role",
                    "mode": "managed",
                    "type": "aws_iam_role",
                    "name": "deployment_role",
                    "provider_config_key": "aws",
                    "expressions": {
                        "assume_role_policy": {
                            "references": [
                                "var.team_account",
                                "var.team_name",
                                "var.environment"
                            ]
                        },
                        "name": {
                            "references": [
                                "var.team_name"
                            ]
                        },
                        "path": {
                            "constant_value": "/deployment-roles/"
                        },
                        "permissions_boundary": {
                            "references": [
                                "module.iam_permission_boundary.policy_arn",
                                "module.iam_permission_boundary"
                            ]
                        },
                        "tags": {
                            "references": [
                                "var.team_name",
                                "var.environment"
                            ]
                        }
                    },
                    "schema_version": 0
                },
                {
                    "address": "aws_iam_role_policy_attachment.attach_deployment_policy",
                    "mode": "managed",
                    "type": "aws_iam_role_policy_attachment",
                    "name": "attach_deployment_policy",
                    "provider_config_key": "aws",
                    "expressions": {
                        "policy_arn": {
                            "references": [
                                "aws_iam_policy.deployment_policy.arn",
                                "aws_iam_policy.deployment_policy"
                            ]
                        },
                        "role": {
                            "references": [
                                "aws_iam_role.deployment_role.name",
                                "aws_iam_role.deployment_role"
                            ]
                        }
                    },
                    "schema_version": 0,
                    "depends_on": [
                        "aws_iam_policy.deployment_policy"
                    ]
                }
            ],
            "module_calls": {
                "iam_permission_boundary": {
                    "source": "git::https://github.com/androzo/iam-permission-boundaries.git//modules/permission-boundary?ref=main",
                    "expressions": {
                        "boundary_type": {
                            "constant_value": "deployment"
                        },
                        "team": {
                            "references": [
                                "var.team_name"
                            ]
                        }
                    },
                    "module": {
                        "outputs": {
                            "policy_arn": {
                                "expression": {
                                    "references": [
                                        "aws_iam_policy.boundary.arn",
                                        "aws_iam_policy.boundary"
                                    ]
                                }
                            }
                        },
                        "resources": [
                            {
                                "address": "aws_iam_policy.boundary",
                                "mode": "managed",
                                "type": "aws_iam_policy",
                                "name": "boundary",
                                "provider_config_key": "aws",
                                "expressions": {
                                    "description": {
                                        "references": [
                                            "var.boundary_type"
                                        ]
                                    },
                                    "name": {
                                        "references": [
                                            "local.name"
                                        ]
                                    },
                                    "path": {
                                        "constant_value": "/permission-boundaries/"
                                    },
                                    "policy": {
                                        "references": [
                                            "path.module",
                                            "var.boundary_type",
                                            "var.team"
                                        ]
                                    },
                                    "tags": {
                                        "references": [
                                            "local.name"
                                        ]
                                    }
                                },
                                "schema_version": 0
                            }
                        ],
                        "variables": {
                            "boundary_type": {
                                "description": "Type of boundary: 'deployment' or 'human'"
                            },
                            "team": {
                                "description": "Team name to scope resources"
                            }
                        }
                    }
                }
            },
            "variables": {
                "aws_region": {
                    "default": "sa-east-1",
                    "description": "The AWS region to deploy the resources in."
                },
                "environment": {
                    "default": "devl",
                    "description": "The environment to deploy the resources in."
                },
                "team_account": {
                    "default": "396608777381",
                    "description": "The AWS account ID of the team."
                },
                "team_name": {
                    "default": "team-anders",
                    "description": "The name of the team."
                }
            }
        }
    },
    "relevant_attributes": [
        {
            "resource": "aws_iam_policy.deployment_policy",
            "attribute": [
                "arn"
            ]
        },
        {
            "resource": "aws_iam_role.deployment_role",
            "attribute": [
                "name"
            ]
        },
        {
            "resource": "module.iam_permission_boundary.aws_iam_policy.boundary",
            "attribute": [
                "arn"
            ]
        }
    ],
    "checks": [
        {
            "address": {
                "kind": "var",
                "module": "module.iam_permission_boundary",
                "name": "boundary_type",
                "to_display": "module.iam_permission_boundary.var.boundary_type"
            },
            "status": "pass",
            "instances": [
                {
                    "address": {
                        "module": "module.iam_permission_boundary",
                        "to_display": "module.iam_permission_boundary.var.boundary_type"
                    },
                    "status": "pass"
                }
            ]
        }
    ],
    "timestamp": "2025-04-07T23:24:05Z",
    "applyable": true,
    "complete": true,
    "errored": false
}
