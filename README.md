# Ready to go Django deployment with AWS
This repository automates the process of setting up a *basic* Django production environment.

## What you will need:
* Packer installed
* An AWS account

######Note:
The ease of this process depends on whether you have already launched an EC2 instance from the AWS console

### Packer
The builder in the packer template creates a t2.micro (free tier) AMI with Ubuntu-14.04-x64.

The provisioners used are a remote shell to set up the python environment and chef-solo which utilizes the accompanying chef cookbook in order to automate the setup of the NGINX and Gunicorn Configurations.

### Chef Cookbook


## To run the script.

#### FIRST:
You will need to modify the two files contained within ``cookbooks/server_setup/files`` directory. Further instruction on how to do this is provided as comments in each of the respective files.

#### SECOND:
With your AWS credentials stored as environment variables run the following in the command line:

``packer build django_web_server``

#### THIRD:
Launch the instance from the AWS console. Make sure to add HTTP to your security groups. Once you have logged into the server, you will need to ``cd`` into the directory containing your manage.py and enter ``python manage.py runserver``

Exit from the server and, with your browser, proceed to the public DNS provided in the console description for the instance.

Congratulations, your Django application is now public.
