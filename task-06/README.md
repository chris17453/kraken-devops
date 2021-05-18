# Kraken DevOps Test
[Back to root README.md](/README.md)

## Task 6 Terraform lovers unite [25pts]
Write a Terraform module that creates the following resources in IAM;

A role, with no permissions, which can be assumed by users within the same account,
A policy, allowing users / entities to assume the above role,
A group, with the above policy attached,
A user, belonging to the above group.
All four entities should have the same name, or be similarly named in some meaningful way given the context e.g. prod-ci-role, prod-ci-policy, prod-ci-group, prod-ci-user; or just prod-ci. Make the suffixes toggleable, if you like.


## usage
```bash
terraform init
terraform plan
terraform apply -auto-approve
```

## results - terraform plan
```
[nd@nd-wl task-06]$ terraform plan

Terraform used the selected providers to generate the following execution plan. Resource actions are indicated with the following symbols:
  + create

Terraform will perform the following actions:

  # module.kraken-demo.aws_iam_group.demo-group will be created
  + resource "aws_iam_group" "demo-group" {
      + arn       = (known after apply)
      + id        = (known after apply)
      + name      = "nonprod-ci-group"
      + path      = "/users/"
      + unique_id = (known after apply)
    }

  # module.kraken-demo.aws_iam_group_membership.demo-group-membership will be created
  + resource "aws_iam_group_membership" "demo-group-membership" {
      + group = "nonprod-ci-group"
      + id    = (known after apply)
      + name  = "nonprod-ci-group-membership"
      + users = [
          + "nonprod-ci-user",
        ]
    }

  # module.kraken-demo.aws_iam_group_policy.demo-group-policy will be created
  + resource "aws_iam_group_policy" "demo-group-policy" {
      + group  = "nonprod-ci-group"
      + id     = (known after apply)
      + name   = "nonprod-ci-group-policy"
      + policy = jsonencode(
            {
              + Statement = [
                  + {
                      + Action   = [
                          + "sts:AssumeRole",
                        ]
                      + Effect   = "Allow"
                      + Resource = "*"
                    },
                ]
              + Version   = "2012-10-17"
            }
        )
    }

  # module.kraken-demo.aws_iam_role.demo-role will be created
  + resource "aws_iam_role" "demo-role" {
      + arn                   = (known after apply)
      + assume_role_policy    = jsonencode(
            {
              + Statement = [
                  + {
                      + Action    = "sts:AssumeRole"
                      + Effect    = "Allow"
                      + Principal = {
                          + AWS = "*"
                        }
                      + Sid       = ""
                    },
                ]
              + Version   = "2012-10-17"
            }
        )
      + create_date           = (known after apply)
      + force_detach_policies = false
      + id                    = (known after apply)
      + managed_policy_arns   = (known after apply)
      + max_session_duration  = 3600
      + name                  = "nonprod-ci-role"
      + path                  = "/"
      + tags                  = {
          + "Environment" = "dev"
          + "Terraform"   = "true"
        }
      + tags_all              = {
          + "Environment" = "dev"
          + "Terraform"   = "true"
        }
      + unique_id             = (known after apply)

      + inline_policy {
          + name   = (known after apply)
          + policy = (known after apply)
        }
    }

  # module.kraken-demo.aws_iam_user.demo-user will be created
  + resource "aws_iam_user" "demo-user" {
      + arn           = (known after apply)
      + force_destroy = false
      + id            = (known after apply)
      + name          = "nonprod-ci-user"
      + path          = "/"
      + tags          = {
          + "Environment" = "dev"
          + "Terraform"   = "true"
        }
      + tags_all      = {
          + "Environment" = "dev"
          + "Terraform"   = "true"
        }
      + unique_id     = (known after apply)
    }

Plan: 5 to add, 0 to change, 0 to destroy.

────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────

Note: You didn't use the -out option to save this plan, so Terraform can't guarantee to take exactly these actions if you run "terraform apply" now.

```

## results - terraform apply
```bash
[nd@nd-wl task-06]$ terraform apply -auto-approve

module.kraken-demo.aws_iam_group.demo-group: Creating...
module.kraken-demo.aws_iam_user.demo-user: Creating...
module.kraken-demo.aws_iam_role.demo-role: Creating...
module.kraken-demo.aws_iam_group.demo-group: Creation complete after 1s [id=nonprod-ci-group]
module.kraken-demo.aws_iam_group_policy.demo-group-policy: Creating...
module.kraken-demo.aws_iam_user.demo-user: Creation complete after 1s [id=nonprod-ci-user]
module.kraken-demo.aws_iam_group_membership.demo-group-membership: Creating...
module.kraken-demo.aws_iam_group_policy.demo-group-policy: Creation complete after 0s [id=nonprod-ci-group:nonprod-ci-group-policy]
module.kraken-demo.aws_iam_group_membership.demo-group-membership: Creation complete after 0s [id=nonprod-ci-group-membership]
module.kraken-demo.aws_iam_role.demo-role: Creation complete after 1s [id=nonprod-ci-role]

Apply complete! Resources: 5 added, 0 changed, 0 destroyed.

```