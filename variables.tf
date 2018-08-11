variable "iam_group" {
  default     = "Admin"
  description = "The AWS groups allowed to assume rile into"
}

variable "profile" {
  description = "AWS profile"
}

variable "region" {
  default     = "us-east-1"
  description = "AWS region"
}

variable "source_account_id" {
  description = "The AWS accounts from where can assume role into"
}

variable "target_account_id" {
  description = "The AWS accounts we can assume role into"
}

variable "target_account_role" {
  description = "The role name in the target account"
  default = "OrganizationAccountAccessRole"
}
