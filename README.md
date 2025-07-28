**Deployment and Service Configuration for private Ollama**
=============================================

This repository defines an Azure Kubernetes Service deployment and runs a Pod containing the Ollama Open Source Platform.

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
