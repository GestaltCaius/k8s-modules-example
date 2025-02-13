resource "helm_release" "podinfo" {
  for_each   = toset(["6.7.1", "6.6.0", "6.5.0"])
  name       = "podinfo-${replace(each.value, ".", "-")}"
  repository = "https://stefanprodan.github.io/podinfo"
  chart      = "podinfo"
  version    = each.value
}
