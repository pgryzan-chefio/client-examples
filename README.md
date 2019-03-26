# client-examples
Examples on how to spin up provision and configure Chef solutions on different platforms

Tools
- Git
- VSCode
- Terraform

Steps
- Open up a terminal, command prompt or powershell
- Move to the directory that you want to put this example into and clone the repository using Git;

git clone https://github.com/pgryzan-chefio/client-examples

- Change the directory to the example platform;

cd client-examples

- Copy the terraform.example file in the same directory and rename it terraform.tfvars
- Fill in the required access information for the examples that you are going to run
- Change directory to the example you want to run;

cd azure

- Initialize the example;

terraform init

- Provision the Windows Server 2016 instance;

terraform apply -auto-approve -var-file=../terraform.tfvars

- Clean up the instance using;

terraform destroy -auto-approve -var-file=../terraform.tfvars
