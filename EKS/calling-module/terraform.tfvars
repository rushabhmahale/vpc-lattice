eks_clusters = {
  eks_cluster1 = {
    cluster_name                             = "eks-cluster-test"
    cluster_version                          = "1.31"
    cluster_endpoint_public_access           = false
    cluster_endpoint_private_access          = true
    enable_cluster_creator_admin_permissions = true
    cluster_compute_config                   = {}
    # If you want to enable Automode Add This 
    # cluster_compute_config = {
    #   enabled       = true
    #   node_pools    = ["general-purpose"]
    #   node_role_arn = "arn:aws:iam::1234567:role/AmazonEKSAutoNodeRole"
    # }
    vpc_id                        = "vpc-68764kdgf"
    subnet_ids                    = ["subnet-agdfiuasg", "subnet-46835648"]
    tags                          = { environment = "prod", team = "devops" }
    create_iam_role               = true
    iam_role_arn                  = ""
    node_iam_role_use_name_prefix = true
    create_node_iam_role          = true
    create_cloudwatch_log_group   = true
    enable_irsa                   = true
    cluster_security_group_additional_rules = {
      ingress_all = {
        protocol    = "-1"
        from_port   = 443
        to_port     = 443
        type        = "ingress"
        cidr_blocks = ["10.104.0.0/16", "10.118.128.0/17"]
      }
    }
    node_security_group_additional_rules = {
      ingress_all = {
        protocol    = "-1"
        from_port   = 443
        to_port     = 443
        type        = "ingress"
        cidr_blocks = ["10.104.0.0/16", "10.118.128.0/17"]
      }
    }
    fargate_profiles = {}
    eks_managed_node_groups = {
      "node-group-1" = {
        create                         = true
        name                           = "ng1"
        use_name_prefix                = true
        subnet_ids                     = ["subnet-6348756348", "subnet-6587547823"]
        min_size                       = 1
        max_size                       = 1
        desired_size                   = 1
        ami_id                         = ""
        ami_type                       = "AL2023_x86_64_STANDARD"
        ami_release_version            = ""
        use_latest_ami_release_version = false
        capacity_type                  = "ON_DEMAND"
        disk_size                      = 20
        force_update_version           = false
        instance_types                 = ["t3.small"]
        labels                         = { env = "production" }
        node_repair_config             = {}
        remote_access = {
          ssh_key_name = ""
        }
        taints = {}
        update_config = {
          max_unavailable = 1
        }
        timeouts                        = {}
        create_launch_template          = false
        use_custom_launch_template      = false
        launch_template_name            = "lt-ng1"
        launch_template_use_name_prefix = false
        instance_type                   = "t3.small"
        key_name                        = "" # "my-win-key"
        enable_monitoring               = false
        enable_efa_support              = false
        enable_efa_only                 = false
        placement                       = {}
        network_interfaces              = []
        maintenance_options             = {}
        private_dns_name_options        = {}
        create_iam_role                 = true
        iam_role_name                   = "eks-node-role-01"
        iam_role_use_name_prefix        = true
        iam_role_description            = "EKS managed node group IAM role"
        iam_role_attach_cni_policy      = true
        iam_role_additional_policies = {
          Policy1 = "arn:aws:iam::aws:policy/AmazonEKSWorkerNodePolicy"
        }
        create_schedule = false
        schedules = {
          scale_up = {
            min_size         = 2
            max_size         = 5
            desired_capacity = 3
            recurrence       = "0 9 * * *"
          }
        }
        platform                          = "linux"
        enable_bootstrap_user_data        = false
        pre_bootstrap_user_data           = ""
        post_bootstrap_user_data          = ""
        bootstrap_extra_args              = ""
        user_data_template_path           = ""
        cloudinit_pre_nodeadm             = []
        cloudinit_post_nodeadm            = []
        cluster_primary_security_group_id = ""
        tags                              = { env = "prod", owner = "rrk" }
      }
    }
    iam_role_name                 = "eks-cluster-1-role"
    iam_role_use_name_prefix      = true
    iam_role_path                 = "/role/"
    iam_role_description          = "IAM role for EKS Cluster 1"
    iam_role_permissions_boundary = ""
    iam_role_tags                 = {}
    iam_role_attach_cni_policy    = true
    create_iam_role_policy        = true
    cluster_addons                = { vpc-cni = true, kube-proxy = true }
  },
  eks_cluster2 {}
}
