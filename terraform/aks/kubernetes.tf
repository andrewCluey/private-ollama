
# 
resource "kubernetes_deployment" "ollama" {
  metadata {
    name = "ollama"
    labels = {
      app = "ollama"
    }
  }

  spec {
    replicas = 1

    selector {
      match_labels = {
        app = "ollama"
      }
    }

    template {
      metadata {
        labels = {
          app = "ollama"
        }
      }

      spec {
        container {
          name  = "ollama"
          image = "ollama/ollama:latest"

          port {
            container_port = 11434
          }

          env {
            name  = "OLLAMA_PORT"
            value = "8080"
          }
        }
      }
    }
  }
}

resource "kubernetes_service" "ollama_service" {
  metadata {
    name = "ollama-service"
  }

  spec {
    load_balancer_source_ranges = [local.client_public_ip]
    selector = {
      app = "ollama"
    }

    port {
      port        = 8080
      target_port = 11434
      protocol    = "TCP"
    }

    type = "LoadBalancer"
  }
}
