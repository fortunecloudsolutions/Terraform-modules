output "arn" {
  description = "The Amazon Resource Name (ARN) specifying the virtual mfa device."
  value       = aws_iam_virtual_mfa_device.example.arn
}

output "base_32_string_seed" {
  description = "The base32 seed defined as specified in RFC3548. The base_32_string_seed is base64-encoded."
  value       = aws_iam_virtual_mfa_device.example.base_32_string_seed
}

output "qr_code_png" {
  description = "A QR code PNG image that encodes otpauth://totp/$virtualMFADeviceName@$AccountName?secret=$Base32String where $virtualMFADeviceName is one of the create call arguments."
  value       = aws_iam_virtual_mfa_device.example.qr_code_png
}

