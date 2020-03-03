locals {
  is_guard_duty_member = var.guard_duty_master_id == "" ? 0 : 1
}

data "aws_caller_identity" "guard_duty_master" {
  provider = aws.security
}

resource "aws_guardduty_detector" "guardduty" {}

resource "aws_guardduty_member" "guardduty" {
  provider = aws.security

  count = local.is_guard_duty_member

  account_id  = aws_guardduty_detector.guardduty.account_id
  detector_id = var.guard_duty_master_id
  email       = var.account_email
  invite      = true
}

resource "aws_guardduty_invite_accepter" "guardduty" {
  count = local.is_guard_duty_member

  detector_id       = aws_guardduty_detector.guardduty.id
  master_account_id = data.aws_caller_identity.guard_duty_master.account_id
}
