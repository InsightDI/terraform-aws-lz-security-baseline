# Security Baseline Module

This module applies the baseline governance toolset for all AmTrust AWS accounts. The full list of platforms employed is listed below.

## Platforms

This list of platforms enumerates the platform, general purpose, and important notes.

### CloudTrail

A CloudTrail is set up in each account that exports events to a write-only s3 bucket in the log archive account. This is done to ensure auditability. Futher configuration of CloudTrail and CloudTrail analytics can be performed on a per-account basis.

### S3 Public Access Block

On Each acount, public access is blocked to S3 buckets at an account level. This may need to be overridable at a future point, but for now it is the default behavior.

Looking forward to future implementations, it may be preferrable to only allow public access S3 buckets in an account specially designated for that.

### AWS Config

AWS config is provisioned to send all rule results to the write-only bucket in the log archive account. Centralized monitoring of config rule results can be performed in the master (root) account.

### Guard Duty

Guard duty is centralized in the Security account. All Guard Duty Detector instances will be set up as members of that Security account's Guard Duty.

### IAM Groups

While IAM should be the responsibility of the account owner, three basic IAM accounts are set up in each account by default:

* amt-{environment_short_name}-admin - Full administrator access (within the bounds set by service control policies) to the account.
* amt-{environment_short_name}-reader - Read-only access to everything in the account
* amt-{environment_short_name}-billing - Access to Cost Management, budgets, and other billing related features for the account. Unless this is the master account, this will not allow the user to see the payment information.

## Version

v0.1.3
