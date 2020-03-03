variable "log_archive_s3_bucket" {
  description = "The ID of the S3 bucket where logs will be archived."
  type        = string
}

variable "environment_short_name" {
  description = "The short name of the environment. This will be included in resource names where applicable. Must only be letters, numbers, underscores, or dashes"
  type        = string
}

variable "guard_duty_master_id" {
  description = "The ID of the master guard duty detector. This would be the one that is aggregating the others. If left blank, this account will not be set up for aggregation. The account with the master guard duty detector would also leave this blank."
  type        = string
  default     = ""
}

variable "account_email" {
  description = "The email used to set up the account."
  type        = string
}

variable "tags" {
  description = "The base tags to apply to the module. Use the amt_tags module to generate these."
  type        = map
}
