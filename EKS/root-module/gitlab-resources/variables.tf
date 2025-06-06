variable "variables" {
    default = null
}

variable "group_name" {
  type        = string
  description = "Name of an Subgroup"
  default     = "group_name"
}

variable "parent_group" {
  type        = string
  description = "Name of an parent subgroup"
  default     = "parent_group"
}

variable "gitlab_projects" {
  type        = map(object({
    project_name                      = string
    gitlab_group_id                   = optional(string)
    approvals_before_merge            = number
    use_custom_template               = optional(string)
    group_with_project_templates_id   = optional(string)
    template_project_id               = optional(string)
    ci_config_path                    = optional(string)
    approvers_group_name              = string
  }))
  description = "Inputs for gitlab project"
}

variable "subgroup_creation" {
  type        = bool
  description = "This will decide, whether we want to create gitlab subgroup or not"
  default     = true
}

variable "project_creation" {
  type        = bool
  description = "This will decide, whether we want to create gitlab project or not"
  default     = true
}

variable "user_approval_list" {
  type        = list(string)
  description = "A list of specific Users to add to the list of approvers."
}
