## Ansible Structure

This directory no longer uses static inventory files as the source of truth.

- `site.yml` bootstraps an in-memory inventory from `terraform output -json`
- Terraform remains the source of truth for host addresses, ACR naming, subnet CIDRs, and Key Vault naming
- Secrets are read at deploy time from Azure Key Vault by the target hosts through their managed identities

Expected control-node prerequisites:

- `terraform` installed
- Access to the Terraform state backend
- SSH access to the ops VM public IP

Optional environment variables:

- `ANSIBLE_USER`
- `ANSIBLE_SSH_PRIVATE_KEY_FILE`
- `IMAGE_TAG`
- `BACKEND_CORS_ALLOWED_ORIGINS`
