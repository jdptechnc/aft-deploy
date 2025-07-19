# Copyright Amazon.com, Inc. or its affiliates. All rights reserved.
# SPDX-License-Identifier: Apache-2.0
#

terraform {
  backend "s3" {
    bucket       = "jdp-aft-module-backend"
    key          = "module-deployment/terraform.tfstate"
    region       = "us-east-1"
    encrypt      = true
    use_lockfile = true #S3 native locking
  }
}

module "aft" {
  source = "github.com/aws-ia/terraform-aws-control_tower_account_factory"
  # Required Vars
  ct_management_account_id  = var.ct_management_account_id
  log_archive_account_id    = var.log_archive_account_id
  audit_account_id          = var.audit_account_id
  aft_management_account_id = var.aft_management_account_id
  ct_home_region            = var.ct_home_region

  # General AFT vars
  cloudwatch_log_group_retention                        = var.cloudwatch_log_group_retention
  backup_recovery_point_retention                       = var.backup_recovery_point_retention
  log_archive_bucket_object_expiration_days             = var.log_archive_bucket_object_expiration_days
  aft_backend_bucket_access_logs_object_expiration_days = var.aft_backend_bucket_access_logs_object_expiration_days
  aft_vpc_endpoints                                     = var.aft_vpc_endpoints
  maximum_concurrent_customizations                     = var.maximum_concurrent_customizations
  concurrent_account_factory_actions                    = var.concurrent_account_factory_actions
  global_codebuild_timeout                              = var.global_codebuild_timeout
  tags                                                  = var.tags

  # terraform vars
  terraform_distribution      = var.terraform_distribution
  tf_backend_secondary_region = var.tf_backend_secondary_region

  # VPC definition
  aft_enable_vpc               = var.aft_enable_vpc
  aft_customer_vpc_id          = var.aft_customer_vpc_id
  aft_customer_private_subnets = var.aft_customer_private_subnets

  # VCS Vars
  vcs_provider                                  = var.vcs_provider
  aft_feature_branch_name                       = var.aft_feature_branch_name
  account_request_repo_name                     = var.account_request_repo_name
  global_customizations_repo_name               = var.global_customizations_repo_name
  account_customizations_repo_name              = var.account_customizations_repo_name
  account_provisioning_customizations_repo_name = var.account_provisioning_customizations_repo_name

  # AFT Feature Flags
  aft_feature_cloudtrail_data_events      = var.aft_feature_cloudtrail_data_events
  aft_feature_enterprise_support          = var.aft_feature_enterprise_support
  aft_feature_delete_default_vpcs_enabled = var.aft_feature_delete_default_vpcs_enabled

}