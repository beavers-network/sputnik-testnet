# sputnik-testnet
Terraform script that configures the required server type for a validator node in Hetzner Cloud

## what will you need

[HETZNER CLOUD API TOKEN](https://docs.hetzner.com/cloud/api/getting-started/generating-api-token/)

## short guide

1. Create a tfvars file with your data like this:
```t
 project_name  = "sputnik"
 network_stage = "testnet"
 hcloud_token  = "<your_api_token>"
 pubkey        = "<just_name_of_keypare>"
 sudo_user     = "<your_sudo_user>"
``` 

   
```bash
$ brew install terraform
$ git clone git@github.com:beavers-network/sputnik-testnet.git
$ cd sputnik-testnet/infra/hetzner
# сreate your own data file as in the step above
$ terraform init
$ terraform plan
$ terraform apply
```
