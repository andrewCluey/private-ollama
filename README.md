**Deployment and Service Configuration for private Ollama**
=============================================

This repository is an exmaple repository for running private LLMs using Ollama. There are options to run with an Azure Kubernetes Service, with the Ollama Open Source Platform.

Alternatvely, deploy a bundled container with the open-webui and ollama in an Azure COntainer App. 

Both can be deployed simply anbd quickly using Terraform, within the ./terraform directory.
- aca: Is used for the Azure Container App deployment
- aks: Will deploy Ollama in an instance of Azure Kubernetes Services.

### Deployment

The deployment named "ollama" creates a single replica of the Ollama container, using the image `ollama/ollama:latest`. The container exposes port 11434 to "8080".

### Service

A Load Balancer service, named "ollama-service", will listen for incoming requests on port 
8080, which is then forwarded to the internal port 11434.

The Terraform deployment will gather the Public IP Address from where you run terraform, and configure the service to only accept connections from this IP address.

**Usage**

To deploy this solution, clone the repository, change directory to `terraform` and run the standard terraform deployment commands:
- teraform init
- terraform plan
- terraform apply

To destroy the solution when you are finished, run:
- terraform destroy

##
