# setup local variables to use in this demo tf file
# suffix toggle can be handlede wth a module, but it's late.
locals {
    demo-user             = (var.suffix == true ? "${var.name}-user"             : "${var.name}")
    demo-role             = (var.suffix == true ? "${var.name}-role"             : "${var.name}")
    demo-policy           = (var.suffix == true ? "${var.name}-policy"           : "${var.name}")
    demo-group            = (var.suffix == true ? "${var.name}-group"            : "${var.name}")
    demo-group-policy     = (var.suffix == true ? "${var.name}-group-policy"     : "${var.name}")
    demo-group-membership = (var.suffix == true ? "${var.name}-group-membership" : "${var.name}")
}

# Create a policy for a role
data "aws_iam_policy_document" "demo-policy-document" {
  statement {
    actions = ["sts:AssumeRole"]
    principals {
      type        = "AWS"
      identifiers = ["*"]
    }    
  }
}

# create a role 
resource "aws_iam_role" "demo-role" {
  name = "${local.demo-role}"
  assume_role_policy =data.aws_iam_policy_document.demo-policy-document.json
  tags=var.tags
}

# create user alpha
resource "aws_iam_user" "demo-user" {
  name = "${local.demo-user}"
  tags=var.tags
}

# create a group
resource "aws_iam_group" "demo-group" {
  name = "${local.demo-group}"
  path = "/users/"
}

# create an assume role policy for the demo group
# allow everything (obvious security issue)
resource "aws_iam_group_policy" "demo-group-policy" {
  name  = "${local.demo-group-policy}"
  group = aws_iam_group.demo-group.name

  # Terraform's "jsonencode" function converts a
  # Terraform expression result to valid JSON syntax.
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = [
          "sts:AssumeRole",
        ]
        Effect   = "Allow"
        Resource = "*"
      },
    ]
  })
}


# Add users to the group
resource "aws_iam_group_membership" "demo-group-membership" {
  name = "${local.demo-group-membership}"
  group = aws_iam_group.demo-group.name
  users = [ aws_iam_user.demo-user.name, ]
}