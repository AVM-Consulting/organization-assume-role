## organization-assume-role 
After creating an account in the organization, follow the following steps to grant access to a group in the root account.

    export AWS_DEFAULT_REGION=us-east-1
    export AWS_PROFILE=xxx
    SOURCE_ACCOUNT_ID=$(aws sts get-caller-identity --query Account --output text --profile $AWS_PROFILE)
    # enter the account id to which access is needed
    TARGET_ACCOUNT_ID=xxx
    #Group which will be allowed to assume role/login
    IAM_GROUP=Admin

Initialize terraform, plan and apply

    terraform init

Run terraform plan

    terraform plan \
      -var "profile=$AWS_PROFILE"\
      -var "iam_group=$IAM_GROUP"\
      -var "source_account_id=$SOURCE_ACCOUNT_ID"\
      -var "target_account_id=$TARGET_ACCOUNT_ID"\
      -var "target_account_role=OrganizationAccountAccessRole"

Apply terraform plan

    terraform apply \
      -var "profile=$AWS_PROFILE"\
      -var "iam_group=$IAM_GROUP"\
      -var "source_account_id=$SOURCE_ACCOUNT_ID"\
      -var "target_account_id=$TARGET_ACCOUNT_ID"\
      -var "target_account_role=OrganizationAccountAccessRole"

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| iam_group | The AWS groups allowed to assume rile into | string | `Admin` | no |
| profile | AWS profile | string | - | yes |
| region | AWS region | string | `us-east-1` | no |
| source_account_id | The AWS accounts from where can assume role into | string | - | yes |
| target_account_id | The AWS accounts we can assume role into | string | - | yes |
| target_account_role | The role name in the target account | string | `OrganizationAccountAccessRole` | no |
