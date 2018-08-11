terraform {
  required_version = ">=0.11.7"
}

provider "aws" {
  profile = "${var.profile}"
  region = "${var.region}"
}

module "organization" {
  source   = "modules/organization"
  iam_group = "${var.iam_group}"
  source_account_id = "${var.source_account_id}"
  target_account_id = "${var.target_account_id}"
  target_account_role = "${var.target_account_role}"
}
