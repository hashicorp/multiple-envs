# Multiple Environments in Terraform

This is an example repository showing how to structure your Terraform code for multiple environments and deploy changes.

## Setup

To setup a multi-environment deployment workflow, create a new Terraform Enterprise environment for each and link them to the appropriate branch on the repo.

1. Fork the [hashicorp/multiple-envs](https://github.com/hashicorp/multiple-envs) repo
1. [Link](https://atlas.hashicorp.com/settings/connections) your Atlas account to GitHub
1. Use the [Import tool](https://atlas.hashicorp.com/configurations/import) to create new environments for `demo-dev`, `demo-staging`, and `demo-prod`
  - **Name the environment**: `demo-dev`, `demo-staging`, or `demo-prod` depending on the environment you're creating
  - **GitHub repository**: `multiple-envs`
  - **GitHub branch**: `dev`, `staging`, or `master` depending on the environment you're creating
1. Go to "Variables" in the left navigation of each environment and add the below Environment Variables
  - `AWS_ACCESS_KEY_ID`: <YOUR_AWS_ACCESS_KEY_ID>
  - `AWS_SECRET_ACCESS_KEY`: <YOUR_AWS_SECRET_ACCESS_KEY>
  - `AWS_DEFAULT_REGION`: `us-east-1`
  - `TF_ATLAS_DIR`: `dev`, `staging`, or `prod` depending on the environment you're creating
1. Click **Queue plan** and **Confirm & apply** for each environment to deploy the infrastructure

> :information_source: You can override the default variables for each environment by adding "Terraform Variables" in the same place you added the Environment Variables

## Deployment Workflow

Below is an example deployment workflow you can use to version changes through each environment in a collaborative way.

1. Create a feature branch with a proposed change, adding a new tag to the security group in [network.tf](modules/network/network.tf#L26) for example
1. Merge that feature branch into the `dev` branch
1. Deploy the change to the `dev` environment in Terraform Enterprise
1. Upon a successful deploy, merge the `dev` branch into the `staging` branch
1. Deploy the change to the `staging` environment in Terraform Enterprise
1. Upon a successful deploy, merge the `staging` branch into `master`
1. Deploy the change to the `prod` environment in Terraform Enterprise
1. If necessary, revert the commit and rollback the changes
