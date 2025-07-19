#########################################
# Control Tower Core Account Parameters
#########################################
ct_management_account_id = "480875379890"
log_archive_account_id   = "500746601129"
audit_account_id         = "104363823828"

#########################################
# General AFT Vars
#########################################
aft_management_account_id                             = "513282776145"
ct_home_region                                        = "us-east-1"
cloudwatch_log_group_retention                        = 3
backup_recovery_point_retention                       = 3 # Dynamo DB table recovery point retention in days
log_archive_bucket_object_expiration_days             = 3
aft_backend_bucket_access_logs_object_expiration_days = 3
aft_vpc_endpoints                                     = true
# maximum_concurrent_customizations = 5
# concurrent_account_factory_actions = 5
# global_codebuild_timeout = 60
# tags = {                          # optional tags to apply to all AFT resources
#   "Environment" = "Production"
# }

#########################################
# AFT Feature Flags - settings for accounts provisioned by AFT
#########################################
# aft_feature_cloudtrail_data_events      = false
# aft_feature_enterprise_support          = false
aft_feature_delete_default_vpcs_enabled = true

#########################################
# AFT Customer VCS Variables - only the variables required by github are shown here
# for other VCS providers, see the official AFT documentation
#########################################
aft_feature_branch_name                       = "main"
vcs_provider                                  = "github"
account_request_repo_name                     = "jdptechnc/aft-account-customizations"
global_customizations_repo_name               = "jdptechnc/aft-account-provisioning-customizations"
account_customizations_repo_name              = "jdptechnc/aft-account-request"
account_provisioning_customizations_repo_name = "jdptechnc/aft-global-customizations"
#########################################
# AFT Terraform Distribution Variables - only the variables required by community edition terraform are shown here
#########################################
# terraform_version = ""
terraform_distribution      = "oss"
# tf_backend_secondary_region = "us-west-2"   # uncomment to use a secondary region for the Terraform backend for AFT

#########################################
# AFT VPC Variables - only variables related to using existing vpc are shown here
#########################################
aft_enable_vpc      = true                    # Use a VPC instead of public internet
aft_customer_vpc_id = "vpc-0674aa445e44cf89a" # Use an existing VPC previously created for use by AFT management
aft_customer_private_subnets = [
  "subnet-07c32b3b4ce9594d1"
]

#########################################
# AFT Metrics Reporting Variables
#########################################
# aft_metrics_reporting = false