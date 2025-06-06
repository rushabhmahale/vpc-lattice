variable "eks_clusters" {
  description = "A map of EKS cluster configurations."
  type = map(object({
    cluster_name                             = string
    cluster_version                          = string
    cluster_endpoint_public_access           = bool
    cluster_endpoint_private_access          = bool
    enable_cluster_creator_admin_permissions = bool
    cluster_compute_config                   = any
    vpc_id                                   = string
    subnet_ids                               = list(string)
    tags                                     = map(string)
    create_iam_role                          = bool
    iam_role_arn                             = string
    node_iam_role_use_name_prefix            = bool
    create_node_iam_role                     = bool
    create_cloudwatch_log_group              = bool
    enable_irsa                              = bool
    cluster_security_group_additional_rules = map(object({
      protocol    = string
      from_port   = number
      to_port     = number
      type        = string
      cidr_blocks = list(string)
    }))
    node_security_group_additional_rules = map(object({
      protocol    = string
      from_port   = number
      to_port     = number
      type        = string
      cidr_blocks = list(string)
    }))
    fargate_profiles = map(object{})
    eks_managed_node_groups = map(object({
      create                         = bool
      name                           = string
      use_name_prefix                = bool
      subnet_ids                     = list(string)
      min_size                       = number
      max_size                       = number
      desired_size                   = number
      ami_id                         = string
      ami_type                       = string
      ami_release_version            = optional(string)
      use_latest_ami_release_version = bool
      capacity_type                  = string
      disk_size                      = number
      force_update_version           = bool
      instance_types                 = list(string)
      labels                         = map(string)
      node_repair_config             = any
      remote_access = object({
        ssh_key_name = string
      })
      taints = map(any)
      update_config = object({
        max_unavailable = number
      })
      timeouts                        = any
      create_launch_template          = bool
      use_custom_launch_template      = bool
      launch_template_name            = string
      launch_template_use_name_prefix = bool
      instance_type                   = string
      key_name                        = string
      enable_monitoring               = bool
      enable_efa_support              = bool
      enable_efa_only                 = bool
      placement                       = any
      network_interfaces              = list(any)
      maintenance_options             = any
      private_dns_name_options        = any
      create_iam_role                 = bool
      iam_role_name                   = string
      iam_role_use_name_prefix        = bool
      iam_role_description            = string
      iam_role_attach_cni_policy      = bool
      iam_role_additional_policies    = map(string)
      create_schedule                 = bool
      schedules = map(object({
        min_size         = number
        max_size         = number
        desired_capacity = number
        recurrence       = string
      }))
      platform                          = string
      enable_bootstrap_user_data        = bool
      pre_bootstrap_user_data           = string
      post_bootstrap_user_data          = string
      bootstrap_extra_args              = string
      user_data_template_path           = string
      cluster_primary_security_group_id = string
      tags                              = map(string)
    }))
    iam_role_name                 = string
    iam_role_use_name_prefix      = bool
    iam_role_path                 = string
    iam_role_description          = string
    iam_role_permissions_boundary = string
    iam_role_tags                 = map(string)
    iam_role_attach_cni_policy    = bool
    create_iam_role_policy        = bool
    cluster_addons                = map(any)
  }))
}

