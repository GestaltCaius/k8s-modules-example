resource "helm_release" "gateway" {
  name  = "gateway-and-http-routes"
  chart = "${path.root}/../../../charts/gateways"
  values = [
    file("${path.module}/values/gateway.yaml"),
  ]
}
