resource "aws_config_config_rule" "s3_bucket_ssl_requests_only" {
  name = "amt-${var.environment_short_name}-s3_bucket_ssl_requests_only"

  source {
    owner             = "AWS"
    source_identifier = "S3_BUCKET_SSL_REQUESTS_ONLY"
  }

  depends_on = [aws_config_configuration_recorder.config_recorder]
}

resource "aws_config_config_rule" "s3_bucket_public_read_prohibited" {
  name = "amt-${var.environment_short_name}-s3_bucket_public_read_prohibited"

  source {
    owner             = "AWS"
    source_identifier = "S3_BUCKET_PUBLIC_READ_PROHIBITED"
  }

  depends_on = [aws_config_configuration_recorder.config_recorder]
}

resource "aws_config_config_rule" "s3_bucket_public_write_prohibited" {
  name = "amt-${var.environment_short_name}-s3_bucket_public_write_prohibited"

  source {
    owner             = "AWS"
    source_identifier = "S3_BUCKET_PUBLIC_WRITE_PROHIBITED"
  }

  depends_on = [aws_config_configuration_recorder.config_recorder]
}

resource "aws_config_config_rule" "s3_bucket_replication_enabled" {
  name = "amt-${var.environment_short_name}-s3_bucket_replication_enabled"

  source {
    owner             = "AWS"
    source_identifier = "S3_BUCKET_REPLICATION_ENABLED"
  }

  depends_on = [aws_config_configuration_recorder.config_recorder]
}

resource "aws_config_config_rule" "s3_bucket_server_side_encryption_enabled" {
  name = "amt-${var.environment_short_name}-s3_bucket_server_side_encryption_enabled"

  source {
    owner             = "AWS"
    source_identifier = "S3_BUCKET_SERVER_SIDE_ENCRYPTION_ENABLED"
  }

  depends_on = [aws_config_configuration_recorder.config_recorder]
}

resource "aws_config_config_rule" "s3_bucket_logging_enabled" {
  name = "amt-${var.environment_short_name}-s3_bucket_logging_enabled"

  source {
    owner             = "AWS"
    source_identifier = "S3_BUCKET_LOGGING_ENABLED"
  }

  depends_on = [aws_config_configuration_recorder.config_recorder]
}

resource "aws_config_config_rule" "access_keys_rotated" {
  name = "amt-${var.environment_short_name}-iam_access_keys_rotated"

  input_parameters = <<EOF
{
  "maxAccessKeyAge": "90"
}
  EOF

  source {
    owner             = "AWS"
    source_identifier = "ACCESS_KEYS_ROTATED"
  }

  depends_on = [aws_config_configuration_recorder.config_recorder]
}

resource "aws_config_config_rule" "iam_group_has_users_check" {
  name = "amt-${var.environment_short_name}-iam_group_has_users_check"

  source {
    owner             = "AWS"
    source_identifier = "IAM_GROUP_HAS_USERS_CHECK"
  }

  depends_on = [aws_config_configuration_recorder.config_recorder]
}

resource "aws_config_config_rule" "iam_password_policy" {
  name = "amt-${var.environment_short_name}-iam_password_policy"

  input_parameters = <<EOF
{
  "MinimumPasswordLength": "12",
  "PasswordReusePrevention": "12"
}
  EOF

  source {
    owner             = "AWS"
    source_identifier = "IAM_PASSWORD_POLICY"
  }

  depends_on = [aws_config_configuration_recorder.config_recorder]
}

# resource "aws_config_config_rule" "iam_policy_blacklisted_check" {
#   name = "amt-${var.environment_short_name}-iam_policy_blacklisted_check"

#   input_parameters = <<EOF
# {}
#   EOF

#   source {
#     owner             = "AWS"
#     source_identifier = "IAM_POLICY_BLACKLISTED_CHECK"
#   }

#  depends_on = [aws_config_configuration_recorder.config_recorder]
# }

resource "aws_config_config_rule" "iam_policy_no_statements_with_admin_access" {
  name = "amt-${var.environment_short_name}-iam_policy_no_statements_with_admin_access"

  source {
    owner             = "AWS"
    source_identifier = "IAM_POLICY_NO_STATEMENTS_WITH_ADMIN_ACCESS"
  }

  depends_on = [aws_config_configuration_recorder.config_recorder]
}

# resource "aws_config_config_rule" "iam_role_managed_policy_check" {
#   name = "amt-${var.environment_short_name}-iam_role_managed_policy_check"

#   input_parameters = <<EOF
# {
#   "managedPolicyArns": ""
# }
#   EOF

#   source {
#     owner             = "AWS"
#     source_identifier = "IAM_ROLE_MANAGED_POLICY_CHECK"
#   }

# depends_on = [aws_config_configuration_recorder.config_recorder]
# }

resource "aws_config_config_rule" "iam_root_access_key_check" {
  name = "amt-${var.environment_short_name}-iam_root_access_key_check"

  source {
    owner             = "AWS"
    source_identifier = "IAM_ROOT_ACCESS_KEY_CHECK"
  }

  depends_on = [aws_config_configuration_recorder.config_recorder]
}

resource "aws_config_config_rule" "iam_user_group_membership_check" {
  name = "amt-${var.environment_short_name}-iam_user_group_membership_check"

  source {
    owner             = "AWS"
    source_identifier = "IAM_USER_GROUP_MEMBERSHIP_CHECK"
  }

  depends_on = [aws_config_configuration_recorder.config_recorder]
}

resource "aws_config_config_rule" "iam_user_mfa_enabled" {
  name = "amt-${var.environment_short_name}-iam_user_mfa_enabled"

  source {
    owner             = "AWS"
    source_identifier = "IAM_USER_MFA_ENABLED"
  }

  depends_on = [aws_config_configuration_recorder.config_recorder]
}

resource "aws_config_config_rule" "iam_user_no_policies_check" {
  name = "amt-${var.environment_short_name}-iam_user_no_policies_check"

  source {
    owner             = "AWS"
    source_identifier = "IAM_USER_NO_POLICIES_CHECK"
  }

  depends_on = [aws_config_configuration_recorder.config_recorder]
}

resource "aws_config_config_rule" "iam_user_unused_credentials_check" {
  name = "amt-${var.environment_short_name}-iam_user_unused_credentials_check"

  input_parameters = <<EOF
{
  "maxCredentialUsageAge": "90"
}
  EOF

  source {
    owner             = "AWS"
    source_identifier = "IAM_USER_UNUSED_CREDENTIALS_CHECK"
  }

  depends_on = [aws_config_configuration_recorder.config_recorder]
}

resource "aws_config_config_rule" "mfa_enabled_for_iam_console_access" {
  name = "amt-${var.environment_short_name}-iam_mfa_enabled_for_iam_console_access"

  source {
    owner             = "AWS"
    source_identifier = "MFA_ENABLED_FOR_IAM_CONSOLE_ACCESS"
  }

  depends_on = [aws_config_configuration_recorder.config_recorder]
}

resource "aws_config_config_rule" "root_account_hardware_mfa_enabled" {
  name = "amt-${var.environment_short_name}-iam_root_account_hardware_mfa_enabled"

  source {
    owner             = "AWS"
    source_identifier = "ROOT_ACCOUNT_HARDWARE_MFA_ENABLED"
  }

  depends_on = [aws_config_configuration_recorder.config_recorder]
}

resource "aws_config_config_rule" "root_account_mfa_enabled" {
  name = "amt-${var.environment_short_name}-iam_root_account_mfa_enabled"

  source {
    owner             = "AWS"
    source_identifier = "ROOT_ACCOUNT_MFA_ENABLED"
  }

  depends_on = [aws_config_configuration_recorder.config_recorder]
}
