data "gitlab_group" "gitlab_group" {
  count     = var.subgroup_creation ? 1 : 0
  full_path = var.parent_group
}

resource "gitlab_group" "core_group" {
  count           = var.subgroup_creation ? 1 : 0
  name            = var.group_name

  parent_id       = data.gitlab_group.gitlab_group[count.index].id
  path            = trimspace(lower(replace(var.group_name, " ", "-")))
}

data "gitlab_user" "users" {
  for_each = toset(var.user_approval_list)

  username = each.value
}

resource "gitlab_project" "gitlab_project" {
  for_each = {
    for k, v in var.gitlab_projects : k => v
    if var.project_creation
  }

  name                            = each.value.project_name
  description                     = "Repository for ${each.value.project_name}"
  namespace_id                    = each.value.gitlab_group_id != null ? each.value.gitlab_group_id : gitlab_group.core_group[0].id 
  visibility_level                = "private"
  shared_runners_enabled          = true
  merge_pipelines_enabled         = true
  approvals_before_merge          = each.value.approvals_before_merge
  use_custom_template             = each.value.use_custom_template
  group_with_project_templates_id = each.value.group_with_project_templates_id
  template_project_id             = each.value.template_project_id
  ci_config_path                  = each.value.ci_config_path
}

resource "gitlab_project_approval_rule" "gitlab_project_approval_rule" {
  for_each = {
    for key, value in var.gitlab_projects : key => value
    if var.project_creation
  }

  project            = gitlab_project.gitlab_project[each.key].id
  name               = each.value.approvers_group_name
  approvals_required = each.value.approvals_before_merge
  user_ids           = [for user in data.gitlab_user.users : user.id]
}

resource "gitlab_group_variable" "gitlab_variables" {
  for_each = var.variables == null ? {} : var.variables

  group             = gitlab_group.core_group[0].id 
  key               = each.value["key"]
  value             = each.value["value"]
  protected         = each.value["protected"]
  masked            = each.value["masked"]
  environment_scope = each.value["environment_scope"]
}