**Deployment and Service Configuration for private Ollama**
=============================================

This YAML file defines a Kubernetes deployment and service for the Ollama application.

### Deployment

The deployment named "ollama" creates a single replica of the Ollama container, using the image `ollama/ollama:latest`. The container exposes port 11434 to "8080".

### Service

A Load Balancer service, named "ollama-service", will listen for incoming requests on port 
8080, which is then forwarded to the internal port 11434.

**Usage**

To use this configuration, apply the YAML file to your Kubernetes cluster using `kubectl apply -f ollama-deployment.yaml`. Once deployed, you can access the Ollama application API by connecting to `<load-balancer-ip>:8080`.

.