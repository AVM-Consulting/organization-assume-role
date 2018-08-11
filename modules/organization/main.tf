variable "iam_group" {}

variable "source_account_id" {}

variable "target_account_id" {}

variable "target_account_role" {}

resource "aws_iam_group_policy" "iam_assume_role_group_policy" {
  name  = "assume_${var.target_account_role}_role_to_${var.target_account_id}"
  group = "${var.iam_group}"

  policy = <<EOF
{
    "Version": "2018-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Action": [
                "sts:AssumeRole"
            ],
            "Resource": [
                "arn:aws:iam::${var.target_account_id}:role/${var.target_account_role}"
            ]
        }
    ]
}
EOF
}
