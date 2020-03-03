provider "aws" {
  alias = "security"
}

provider "aws" {
  alias = "logarch"
}

data "aws_region" "current" {}

data "aws_s3_bucket" "logarch" {
  provider = aws.logarch

  bucket = var.log_archive_s3_bucket
}

### S3 bucket security
# resource "aws_s3_account_public_access_block" "prevent_s3_public_access" {
#   block_public_acls       = true
#   block_public_policy     = true
#   ignore_public_acls      = true
#   restrict_public_buckets = true
# }

### CloudTrail
resource "aws_cloudtrail" "cloudtrail_resource" {
  name                          = "amt-${var.environment_short_name}-cloudtrail"
  s3_bucket_name                = data.aws_s3_bucket.logarch.id
  s3_key_prefix                 = "log/${var.environment_short_name}/"
  include_global_service_events = true

  lifecycle {
    prevent_destroy = false
  }

  tags = merge(var.tags, { asset-role = "governance:auditability" })
}
