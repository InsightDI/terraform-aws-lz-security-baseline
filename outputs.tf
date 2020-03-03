output "aws_guardduty_detector_id" {
  description = "The ID of the Guardduty detector created for this account."
  value       = aws_guardduty_detector.guardduty.id
}
