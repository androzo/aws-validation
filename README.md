# ![Build Status](https://img.shields.io/badge/build-passing-brightgreen)

# AWS Validation 
Github Action that runs validations in AWS resources being deployed via Terraform. Uses Open Policy Agent to check if resources are tagged, more rules can be added to improve compliance.

## Features

- Automated validation of AWS resources.
- Compliance checks against AWS best practices.
- Customizable validation rules.
- Detailed reporting of validation results.


## Usage

### Tools to test locally

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
