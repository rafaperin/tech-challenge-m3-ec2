variable "aws_access_key_id" {
  description = "Access key ID from AWS IAM"
  type        = string
  sensitive   = true
}
variable "aws_secret_acess_key" {
  description = "Secret access key from AWS IAM"
  type        = string
  sensitive   = true
}