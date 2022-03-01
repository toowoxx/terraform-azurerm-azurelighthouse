// get current subscription context for Lighthouse assigment
data "azurerm_subscription" "current" {
}

// creating the definition for the Lighthouse management
resource "azurerm_lighthouse_definition" "lighthouse_definition" {
  name               = "Azure Lighthouse Management"
  description        = "Azure Lighthouse Management from tenant id ${var.managing_tenant_id}"
  managing_tenant_id = var.managing_tenant_id
  scope              = data.azurerm_subscription.current.id
  authorization {
    principal_id       = var.principal_id
    role_definition_id = var.role_definition_id
  }
}

// The Lighthouse management is being assigned to the subscription that Terraform connects to. 
// for onboarding other subscriptions you have to open a new subscription context.
resource "azurerm_lighthouse_assignment" "lighthouse_assignment" {
  scope                    = data.azurerm_subscription.current.id
  lighthouse_definition_id = azurerm_lighthouse_definition.lighthouse_definition.id
}