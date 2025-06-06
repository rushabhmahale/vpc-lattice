module "eks" {

  #source   = "../root-module/tf-eks-module"
 
  source = "git::https://github.com/rushabhmahale/vpc-lattice.git//EKS/root-module?ref=master"
  
  for_each = var.eks_clusters
  
 
  cluster_name                             = each.value.cluster_name
  cluster_version                          = each.value.cluster_version
  cluster_endpoint_public_access           = each.value.cluster_endpoint_public_access
  cluster_endpoint_private_access          = each.value.cluster_endpoint_private_access
  enable_cluster_creator_admin_permissions = each.value.enable_cluster_creator_admin_permissions
  cluster_compute_config                   = each.value.cluster_compute_config
  vpc_id                                   = each.value.vpc_id
  subnet_ids                               = each.value.subnet_ids
  tags                                     = each.value.tags
  create_iam_role                          = each.value.create_iam_role
  iam_role_arn                             = each.value.iam_role_arn
  node_iam_role_use_name_prefix            = each.value.node_iam_role_use_name_prefix
  create_node_iam_role                     = each.value.create_node_iam_role
  create_cloudwatch_log_group              = each.value.create_cloudwatch_log_group
  enable_irsa                              = each.value.enable_irsa
  cluster_security_group_additional_rules  = each.value.cluster_security_group_additional_rules
  node_security_group_additional_rules     = each.value.node_security_group_additional_rules
  fargate_profiles                         = each.value.fargate_profiles
  eks_managed_node_groups                  = each.value.eks_managed_node_groups
  iam_role_name                            = each.value.iam_role_name
  iam_role_use_name_prefix                 = each.value.iam_role_use_name_prefix
  iam_role_path                            = each.value.iam_role_path
  iam_role_description                     = each.value.iam_role_description
  iam_role_permissions_boundary            = each.value.iam_role_permissions_boundary
  iam_role_tags                            = each.value.iam_role_tags
  # iam_role_attach_cni_policy                    = each.value.iam_role_attach_cni_policy
  # create_iam_role_policy                        = each.value.create_iam_role_policy
  cluster_addons = each.value.cluster_addons
}
