## S3 Static Website and CloudFront
This project is a simple static website hosted in an S3 bucket and CloudFront.

### Requirements
- AWS Cli
- Terraform Cli
- Docker*
- Localstack Cli*
- S3 Bucket pre-built in AWS**

### Notes
- *Not essential, but recommended.
- **Is also possible to create a new bucket in this terraform script.

### Localstack
To use LocalStack on your local machine, add a profile in the aws cli settings:
- `~/.aws/credentials`
- `~/.aws/config`

### Terraform State
There is a S3 bucket pre-built used to store the terraform state file.
The bucket name is defined in the `backend.tf` file.

### Github Actions
The Github Actions is used to run the terraform script and deploy the infra for a static web site in the AWS environment.

Set the aws credential in the github repository secrets.

The script only will run if the branch starts with `feature/`.

### Commands
```shell
localstack start -d
```

```shell
localstack stop
```

```shell
terraform -chdir=infra init
```

```shell
terraform -chdir=infra validate
```

```shell
terraform -chdir=infra fmt
```

```shell
terraform -chdir=infra plan
```

```shell
terraform -chdir=infra apply -auto-approve
```

```shell
terraform -chdir=infra destroy -auto-approve
```