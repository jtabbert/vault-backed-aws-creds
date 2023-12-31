# Vault-backed AWS Dynamic Credentials

**Instructions**

This guide is intended to be used with the following private Instruqt track.  This guide also assumes your TFC Org has a VCS provider configured, and the hashicat-aws repo in your account.

https://play.instruqt.com/HashiCorp-EA/invite/ecaifwjjw47v/tracks/vault-dynamic-creds-tfc

**The Instruqt track uses AWS credentials stored in the KV secrets engine.  In this guide the setup script enables the AWS secrets engine and allow us to demo dynamic credentials.**

1. Complete the track up until the challenge "Set required environment variables in TFC".  This is currently required because skipping is not enabled on the track.  You will need to create the "networking" workspace with the academy org.  The academy org will have a name similar to **acdmy-vault-creds-gbt2wtcmg1ns** and is created automatically.  Creating the "networking" workspace is only to progress forward in the track and it will not be used for anything.

2. Once you have reached "Set required environment variables in TFC".  Create an environment variable called TFC_ORG, you will do this in the Shell - NOT TFC. 
```
export TFC_ORG=YourTFC-OrgHere
```
3. Clone the git repo with the command below
```
git clone https://github.com/jtabbert/vault-backed-aws-creds
```
4. Change directory
```
cd vault-backed-aws-creds
```
5. Run the setup script
```
bash setup-vbdc.sh
```
6. In your TFC Org create a workspace called **"test-vault"** in the **Default Project**

7. In the "test-vault" workspace add the following Variables

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

8. In the **"vault-test"** workspace use the VCS driven workflow and link it to the "hashicat-aws" repo.  A fork of this repo is probably in your GitHub account from previous workshops

9. Update the "deploy_app.sh" file in the **hashicat-aws** repo and watch Vault-Backed Dynamic Credentials in action!  You can make any simple change to this file to trigger a run in TFC

10. To view the leases being created in the Vault, run the following commands to get the VAULT_ADDR and VAULT_TOKEN
```
echo $VAULT_ADDR
echo $VAULT_TOKEN
```
11. If you want to re-use the "test-vault" workspace for a future demo, in TFC queue a destroy plan.  This will save you from having to re-input the Variables :) 
12. You will need to update the **TFC_VAULT_ADDR** variable in the workspace as this will change each time you restart the track
