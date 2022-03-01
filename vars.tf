variable "managing_tenant_id" {
  description = "The tenant ID of the tenant that is managing the resources, usually the service providers tenant"
}
variable "principal_id" {
  description = "The Object ID of the object that should have access to the managed tenant. This can be a user, group, or service principal. This principal must exist in the tenant that is managing the resources, usually the service provider's tenant"
}

variable "role_defintion_id" {
  description = "The role definition ID is the access permissions that is assigned via Azure Ligthouse. You can find all the built-in roles in Azure here -> https://docs.microsoft.com/en-us/azure/role-based-access-control/built-in-roles. Note that owner is not supported for Azure Lighthouse"
}