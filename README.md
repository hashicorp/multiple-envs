# Multiple Environments in Terraform

This is an example repository showing how to structure your Terraform templates for multiple environments.

To setup a multi-environment deployment workflow, create a new Terraform Enterprise environment for each and link them to the appropriate branch on the repo.

1. Fork the [hashicorp/multiple-envs](https://github.com/hashicorp/multiple-envs) repo
1. [Link your Atlas account](https://atlas.hashicorp.com/settings/connections) to GitHub
1. Use the [Import tool](https://atlas.hashicorp.com/configurations/import) to create new environments for `stage`, `qa`, and `prod`
  - "Name the environment": `stage`, `qa`, or `prod` depending on the environment you're creating
  - "GitHub repository": `multiple-envs`
  - "GitHub branch": `stage`, `qa`, or `master` depending on the environment you're creating
1. Go to "Variables" in the left navigation of each environment and add the below Environment Variables
  - `AWS_ACCESS_KEY_ID`: `YOUR_AWS_ACCESS_KEY_ID`
  - `AWS_SECRET_ACCESS_KEY`: `YOUR_AWS_SECRET_ACCESS_KEY`
  - `AWS_DEFAULT_REGION`: `us-east-1`
  - `TF_ATLAS_DIR`: `stage`, `qa`, or `prod` depending on the environment you're creating

Follow the Multi-Environment deployment instructions to safely introduce infrastructure changes with a collaborative workflow.
