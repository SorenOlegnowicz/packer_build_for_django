# Ready to go Django deployment with AWS
This repository automates the process of setting up a *basic* Django Production environment

## What you will need:
* Packer installed
* An AWS account

### Packer
The builder in the packer template creates a free tier AMI with Ubuntu-14.04-x64.

The provisioners used are a remote shell to set up the python environment and chef-solo which utilizes the accompanying chef cookbook in order to automate the NGINX and Gunicorn Configurations.

### Chef Cookbook
...

## To run the script.

#### FIRST:
Modify script.sh with the repository you wish to clone, and...

#### SECOND:
With your AWS credentials stored as environment variables run the following in the command line:

```packer build...```
