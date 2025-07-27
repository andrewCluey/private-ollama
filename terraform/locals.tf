locals {
  name_suffix      = "poc-ai-uks"
  client_public_ip = "${data.http.my_ip.response_body}/32"
}

