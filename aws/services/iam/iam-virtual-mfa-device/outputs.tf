

output "arn" {
  #{"type":"string","default":"dummy"}
  description = "The Amazon Resource Name (ARN) specifying the virtual mfa device."
  value       = module.aws_iam_virtual_mfa_device.arn
}

output "base_32_string_seed" {
  #{"type":"string","default":"dummy"}
  description = "The base32 seed defined as specified in RFC3548. The base_32_string_seed is base64-encoded."
  value       = module.aws_iam_virtual_mfa_device.base_32_string_seed
}

output "qr_code_png" {
  #{"type":"string","default":"dummy"}
  description = "A QR code PNG image that encodes otpauth://totp/$virtualMFADeviceName@$AccountName?secret=$Base32String where $virtualMFADeviceName is one of the create call arguments."
  value       = module.aws_iam_virtual_mfa_device.qr_code_png
}
