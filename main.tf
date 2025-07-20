# Copyright Amazon.com, Inc. or its affiliates. All rights reserved.
# SPDX-License-Identifier: Apache-2.0
#


module "aft" {
  source = "github.com/aws-ia/terraform-aws-control_tower_account_factory"
  # Required Vars
  ct_management_account_id  = local.ct_management_account_id
  log_archive_account_id    = local.log_archive_account_id
  audit_account_id          = local.audit_account_id
  aft_management_account_id = local.aft_management_account_id
  ct_home_region            = local.ct_home_region

  # General AFT vars
  cloudwatch_log_group_retention                        = local.cloudwatch_log_group_retention
  backup_recovery_point_retention                       = local.backup_recovery_point_retention
  log_archive_bucket_object_expiration_days             = local.log_archive_bucket_object_expiration_days
  aft_backend_bucket_access_logs_object_expiration_days = local.aft_backend_bucket_access_logs_object_expiration_days
  aft_vpc_endpoints                                     = local.aft_vpc_endpoints
  # maximum_concurrent_customizations                     = local.maximum_concurrent_customizations
  # concurrent_account_factory_actions                    = local.concurrent_account_factory_actions
  # global_codebuild_timeout                              = local.global_codebuild_timeout
  # tags                                                  = local.tags

  # terraform vars
  terraform_distribution      = local.terraform_distribution
  # tf_backend_secondary_region = local.tf_backend_secondary_region

  # VPC definition
  aft_enable_vpc               = local.aft_enable_vpc
  aft_customer_vpc_id          = local.aft_customer_vpc_id
  aft_customer_private_subnets = local.aft_customer_private_subnets

  # VCS Vars
  vcs_provider                                  = local.vcs_provider
  account_request_repo_name                     = local.account_request_repo_name
  global_customizations_repo_name               = local.global_customizations_repo_name
  account_customizations_repo_name              = local.account_customizations_repo_name
  account_provisioning_customizations_repo_name = local.account_provisioning_customizations_repo_name

  # AFT Feature Flags
  # aft_feature_cloudtrail_data_events      = local.aft_feature_cloudtrail_data_events
  # aft_feature_enterprise_support          = local.aft_feature_enterprise_support
  aft_feature_delete_default_vpcs_enabled = local.aft_feature_delete_default_vpcs_enabled

}