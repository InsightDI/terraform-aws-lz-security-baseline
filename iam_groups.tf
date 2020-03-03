# Account administrator
resource "aws_iam_group" "admin_group" {
  name = "amt-${var.environment_short_name}-admin"
  path = "/users/"
}

resource "aws_iam_group_policy_attachment" "admin_group_policy" {
  group      = aws_iam_group.admin_group.id
  policy_arn = "arn:aws:iam::aws:policy/AdministratorAccess"
}

# Read only
resource "aws_iam_group" "read_only_group" {
  name = "amt-${var.environment_short_name}-reader"
  path = "/users/"
}

resource "aws_iam_group_policy_attachment" "reader_group_policy" {
  group      = aws_iam_group.read_only_group.id
  policy_arn = "arn:aws:iam::aws:policy/ReadOnlyAccess"
}

# Billing
resource "aws_iam_group" "billing_group" {
  name = "amt-${var.environment_short_name}-billing"
  path = "/users/"
}

resource "aws_iam_group_policy_attachment" "billing_group_policy" {
  group      = aws_iam_group.billing_group.id
  policy_arn = "arn:aws:iam::aws:policy/job-function/Billing"
}
