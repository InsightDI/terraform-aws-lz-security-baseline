resource "aws_iam_role" "config_role" {
  name = "amt-${var.environment_short_name}-role-config"

  assume_role_policy = <<POLICY
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "config.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
POLICY

  tags = merge(var.tags, { asset-role = "governance:autidability" })
}

resource "aws_iam_role_policy" "config_policy" {
  name = "amt-${var.environment_short_name}-policy-config"
  role = aws_iam_role.config_role.id

  policy = <<POLICY
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": [
        "s3:*"
      ],
      "Effect": "Allow",
      "Resource": [
        "${data.aws_s3_bucket.logarch.arn}",
        "${data.aws_s3_bucket.logarch.arn}/*"
      ]
    }
  ]
}
POLICY
}

resource "aws_config_configuration_recorder_status" "status" {
  name       = aws_config_configuration_recorder.config_recorder.name
  is_enabled = true

  depends_on = [aws_config_delivery_channel.config_channel]
}

resource "aws_iam_role_policy_attachment" "config_attachment" {
  role       = aws_iam_role.config_role.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSConfigRole"
}

resource "aws_config_delivery_channel" "config_channel" {
  name           = "amt-${var.environment_short_name}-config-channel"
  s3_bucket_name = data.aws_s3_bucket.logarch.id
  s3_key_prefix  = "config"

  depends_on = [aws_config_configuration_recorder.config_recorder]
}

resource "aws_config_configuration_recorder" "config_recorder" {
  name     = "amt-${var.environment_short_name}-config-recorder"
  role_arn = aws_iam_role.config_role.arn

  recording_group {
    all_supported                 = true
    include_global_resource_types = true
  }
}
