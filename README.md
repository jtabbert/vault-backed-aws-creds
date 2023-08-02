# vault-backed-aws-creds

**Instructions**

This guide is intended to be used with the folling private Instruqt track

https://play.instruqt.com/HashiCorp-EA/invite/ecaifwjjw47v/tracks/vault-dynamic-creds-tfc

1. Complete the track up until the challenge "Set required environment variables in TFC"
2. Clone the git repo with the command below
```
git clone https://github.com/jtabbert/vault-backed-aws-creds
```
3. Create an environment variable called TFC_ORG
```
export TFC_ORG="YourTFC-OrgHere"
```
4. In your TFC Org create a workspace called "test-vault" in the Default Project

5. In the "test-vault" workspace add the following Variables

| Variable  | Value  | Type  |
|---|---|---|
| TFC_VAULT_ADDR  | Run echo $VAULT_ADDR in Instruqt  | env  |
| TFC_VAULT_BACKED_AWS_AUTH  | true  | env  |
| TFC_VAULT_BACKED_AWS_AUTH_TYPE | iam_user  |  env |
| TFC_VAULT_BACKED_AWS_RUN_VAULT_ROLE  | my-role  | env  |
| TFC_VAULT_BACKED_AWS_SLEEP_SECONDS  | 30  | env  |
| TFC_VAULT_PROVIDER_AUTH  | true  | env  |
| TFC_VAULT_RUN_ROLE  | vbdc-tfc-role  | env  |
| region  | us-east-1  | terraform  |
| prefix  | hashicat  | terraform  |

6. In the vault-test workspace use the VCS driven workflow and link it to the "hashicat-aws" repo.  A fork of this repo is probably in your GitHub account from previous workshops

7. Update the "deploy_app.sh" file in the hashicat-aws repo and watch Vault-Backed Dynamic Credentials in action!
