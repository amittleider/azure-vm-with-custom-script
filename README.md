This set of scripts deploys a new VM onto Azure and launches a custom script on the new VM.

The custom script in this example is installing docker and launching a VSTS runner, but it could essentially do anything.

All commands are run as the root user. 


Usage:
Login with `az login`, modify the script to have the correct `resource group` and `vm name`, then launch the script. 