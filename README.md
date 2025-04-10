# ![Build Status](https://img.shields.io/badge/build-passing-brightgreen)

# AWS Validation 
Github Action that runs validations in AWS resources being deployed via Terraform. Uses Open Policy Agent to check if resources are tagged, more rules can be added to improve compliance.

## Features

- Automated validation of AWS resources.
- Compliance checks against AWS best practices.
- Customizable validation rules.
- Detailed reporting of validation results.


## Requirements
- A terraform plan in json

```bash
terraform plan -out=tfplan
terraform show -json tfplan > plan.json
```

## Example
```yaml
name: Run AWS Validation checks

on: [push]

jobs:
  test:
    runs-on: ubuntu-latest
    steps:
      - name: Check out repository code
        uses: actions/checkout@v4

      - name: Configure AWS Credentials
        uses: aws-actions/configure-aws-credentials@v4
        with:
          role-to-assume: your-role-arn
          aws-region: your-region
          role-session-name: some-role-session-name

      - name: Init & Plan Terraform
        run: |
          terraform init
          terraform plan -out=tfplan.binary
          terraform show -json tfplan.binary > tfplan.json
        
      - name: Run AWS validation
        uses: androzo/aws-validation@main
        with:
          tfplan_path: tfplan.json
```


## Runing locally

- OPA (1.3.0)
- Docker + ACT (To run GHA locally)

Run the validation locally using `act`:
```bash
act -W ./.github/workflows/test.yaml
```

## Contributing

Contributions are welcome! Please open an issue or submit a pull request.

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.
