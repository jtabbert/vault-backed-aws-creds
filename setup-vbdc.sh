#! /bin/bash

vault secrets enable aws

vault write aws/config/root \
    access_key=$AWS_ACCESS_KEY_ID \
    secret_key=$AWS_SECRET_ACCESS_KEY \
    region=us-east-1

vault write aws/roles/my-role \
    credential_type=iam_user \
    policy_document=-<<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Action": "ec2:*",
      "Resource": "*"
    }
  ]
}
EOF

vault write -f aws/config/rotate-root


vault policy write vbdc-tfc-policy -<<EOF
# Allow tokens to query themselves
path "auth/token/lookup-self" {
  capabilities = ["read"]
}

# Allow tokens to renew themselves
path "auth/token/renew-self" {
    capabilities = ["update"]
}

# Allow tokens to revoke themselves
path "auth/token/revoke-self" {
    capabilities = ["update"]
}

# Configure the secrets the token should have access to
path "aws/creds/*" {
  capabilities = ["read"]
}
EOF

vault write auth/jwt/role/vbdc-tfc-role -<<EOF
{
  "bound_claims_type": "glob",
  "user_claim": "terraform_full_workspace",
  "bound_audiences": "vault.workload.identity",
  "token_policies":"jt-tfc-policy",
  "bound_claims": {
    "sub": ["organization:$TFC_ORG:project:Default Project:workspace:VBDC:run_phase:*"]
  },
  "token_ttl": "1h",
  "role_type": "jwt"
}
EOF
