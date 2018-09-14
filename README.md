This set of scripts deploys a new VM onto Azure and launches a custom script on the new VM.

The custom script in this example is installing docker and launching a VSTS Build Agent (AKA Azure Dev Ops Agent). This is useful especially if you don't want to use the Azure Dev Ops Hosted Agents in your build. Note that the script can be changed o essentially run any bash script on the VM as soon as the resource is created. 

All commands are run as the root user. 


Usage:
Login with `az login`, modify the script to have the correct `resource group` and `vm name`, then launch the script. 
