terraform {
  required_version = ">= 1.3.0"
}

locals {
  app_name = "sample-app"
}

# Dummy resource to allow plan/validate to succeed
resource "null_resource" "example" {
  triggers = {
    name = local.app_name
    env  = "dev"
  }
}

# Add a tags map to allow governance script to run
variable "tags" {
  type = map(string)
  default = {
    env         = "dev"
    owner       = "devops"
    cost-center = "001"
    app         = "sample"
  }
}
