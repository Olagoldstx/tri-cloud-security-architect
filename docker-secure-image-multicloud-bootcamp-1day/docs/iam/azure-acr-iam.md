# Azure ACR — Least Privilege (Textbook Guide)

## Built-in Roles at Registry Scope
- **AcrPush** — push & pull (CI)
- **AcrPull** — pull only (runtime)

### Assign roles (Service Principal or Managed Identity)
```bash
SUB_ID=$(az account show --query id -o tsv)
RG=<your_rg>
ACR_NAME=mysecureacr
SCOPE="/subscriptions/$SUB_ID/resourceGroups/$RG/providers/Microsoft.ContainerRegistry/registries/$ACR_NAME"

# Create Entra App (service principal) for CI
az ad app create --display-name "ci-pusher" > app.json
APP_ID=$(jq -r '.appId' app.json)
az ad sp create --id $APP_ID

# Assign AcrPush to CI at registry scope
az role assignment create --assignee $APP_ID --role "AcrPush" --scope "$SCOPE"

# Assign AcrPull to your runtime identity (AKS/VM)
# az role assignment create --assignee <principalId_or_appId> --role "AcrPull" --scope "$SCOPE"
```

### GitHub OIDC (no secrets)
```bash
APP_ID=<your_app_id>   # from the app created above

az ad app federated-credential create   --id $APP_ID   --parameters '{
    "name": "github-main",
    "issuer": "https://token.actions.githubusercontent.com",
    "subject": "repo:YOUR_GITHUB_OWNER/YOUR_REPO:ref:refs/heads/main",
    "audiences": ["api://AzureADTokenExchange"]
  }'

# Now login in workflow using azure/login with id-token
```

**Workflow login:**
```yaml
permissions:
  id-token: write
  contents: read

steps:
  - uses: actions/checkout@v4
  - uses: azure/login@v2
    with:
      client-id: ${{ secrets.AZURE_CLIENT_ID }}
      tenant-id: ${{ secrets.AZURE_TENANT_ID }}
      subscription-id: ${{ secrets.AZURE_SUBSCRIPTION_ID }}
  - uses: azure/docker-login@v2
    with:
      login-server: ${{ env.ACR_NAME }}.azurecr.io
```
