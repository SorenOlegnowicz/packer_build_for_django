# Ready to go Django deployment with AWS
This repository automates the process of setting up a *basic* Django production environment. This is intended to provide a productive medium for beginners to both learn about deployment and have an application deployed.

## What you will need:
* Packer installed
* An AWS account
* Your project located on a remote repository (in this case github)

###### Note:
The ease of this process depends on whether you have already launched an EC2 instance from the AWS console

### Packer
The builder in the packer template creates a t2.micro (free tier) AMI with Ubuntu-14.04-x64.

The provisioners used are a remote shell to set up the python environment and chef-solo which utilizes the accompanying chef cookbook in order to automate the setup of the NGINX and Gunicorn Configurations.

## To run the script:

#### FIRST:
You will need to modify the two files contained within ``cookbooks/server_setup/files`` directory and the ``remote_shell.sh`` file. Further instruction on how to do this is provided in the comments of each files.

######Note:
If you neglect to modify these files, or do so improperly you WILL encounter errors.

#### SECOND:
With your AWS credentials stored as environment variables run the following in the command line:

``packer build django_web_server``

#### THIRD:
Launch the instance from the AWS console. Make sure to add HTTP to your security groups. Once you have logged into the server, you will need to ``cd`` into the directory containing your manage.py and enter ``python manage.py runserver``

Exit from the server and, with your browser, proceed to the public DNS provided in the console description for the instance.

Congratulations, your Django application is now public.

#### CAUTION:
If you make any changes to the config files after you have launched the instance, you will need to restart that service.

``sudo service [service_name] [command]``

In our case, the commands for the two services (which correspond the two config files in the cookbook) we are mainly concerned with are:

``sudo service nginx restart``
``sudo service virtualized restart``

#### Author's Note
I created this project as a way to make the deployment of a basic Django application a little easier. I will continue to update this project as I learn more about system administration and Amazon Web Services.

###### Future goals:
* Reduce the pre-build changes to a single file
* Add in PostgreSQL support
* Add S3 support
