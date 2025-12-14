resource "azuread_conditional_access_policy" "aws_gatekeeper" {
  display_name = "ZT-TF-AWS-GATEKEEPER"
  state        = "enabled"

  conditions {
    client_app_types = ["all"]

    users {
      included_groups = [
        "b2bb40af-d555-45e9-9020-84b4de52d874"
      ]
    }

    applications {
      included_applications = [
        "6bdeec74-3087-45b7-90f4-ead7911b370c"
      ]
    }
  }

  grant_controls {
    operator          = "OR"
    built_in_controls = ["mfa"]
  }
}
