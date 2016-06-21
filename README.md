# Multiple Environments in Terraform

This is an example repository of Terraform code showing how to deploy and revert infrastructure changes for multiple environments with Terraform Enterprise & GitHub.

## Setup

To setup a multi-environment deployment workflow, create a new Terraform Enterprise environment for each.

1. Fork the [hashicorp/multiple-envs](https://github.com/hashicorp/multiple-envs) repo
1. [Link](https://atlas.hashicorp.com/settings/connections) your Atlas account to GitHub
1. Use the [Import tool](https://atlas.hashicorp.com/configurations/import) to create new environments for `demo-dev`, `demo-staging`, and `demo-prod`
  - **Name the environment**: `demo-dev`, `demo-staging`, or `demo-prod` depending on the environment you're creating
  - **GitHub repository**: `multiple-envs`
1. Go to **Variables** in the left navigation of each environment
  - Add the below **Environment Variables**
    - `AWS_ACCESS_KEY_ID`: `YOUR_AWS_ACCESS_KEY_ID`
    - `AWS_SECRET_ACCESS_KEY`: `YOUR_AWS_SECRET_ACCESS_KEY`
    - `AWS_DEFAULT_REGION`: `us-east-1`
  -  Add the below **Terraform Variables** to override the defaults to be environment specific
    - `name`: `demo-dev`, `demo-staging`, or `demo-prod` depending on the environment you're creating
    - The placeholder variables allow you to remove environment specific or secret/sensitive variables from version control
1. Click **Queue plan** and **Confirm & apply** for each environment to deploy the infrastructure

## Deployment Workflow

Below is an example deployment workflow you can use to version changes through each environment in a collaborative way.

1. Create and push a feature branch with a proposed change, for example, adding a new tag to the security group in [network.tf](modules/network/network.tf#L26)
1. Create a pull request for your feature branch against `master`
  - You should see 3 Terraform plan checks that have changes
1. Deploy your feature branch to `demo-dev`
  - Go to **Integrations** in the left navigation of the `demo-dev` environment and enter your feature branch name into **GitHub branch**, then click **Update GitHub settings**
  - This will automatically trigger a plan that you can **Confirm & Apply** in **Runs** to deploy
1. Deploy your feature branch to `demo-staging`
  - Go to **Integrations** in the left navigation of the `demo-staging` environment and enter your feature branch name into **GitHub branch**, then click **Update GitHub settings**
  - This will automatically trigger a plan that you can **Confirm & Apply** in **Runs** to deploy
1. Deploy your feature branch to `demo-prod` now that you've tested the change in `demo-dev` and `demo-staging`
  - Merge your pull request
  - This will trigger a Terraform plan in **Runs** of the `demo-prod` environment that you can **Confirm & Apply** to deploy
1. Remove your feature branch from **GitHub branch** in **Integrations** of `demo-dev` and `demo-staging` and click **Update GitHub settings**, there should be no changes

## Revert Workflow

In the event that one of your commits should need to be reverted, you can follow the below steps to achieve this.

1. Go to **Runs** in the left navigation of the `demo-prod` environment and click on the run that you would like to revert
1. On the top right, click the Git SHA link that triggered this run
1. In GitHub, navigate to the PR that was associated with this commit and click **Revert**
1. Create a pull request to revert the change, this should have Terraform plan change checks across all 3 environments
1. Upon success of the Terraform plan checks, merge the pull request
1. This will trigger a Terraform plan in all 3 environments that you can **Confirm & Apply** to revert the change
