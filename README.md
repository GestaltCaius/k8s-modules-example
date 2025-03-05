```bash
terraform init -backend-config "bucket=$BUCKET_NAME" -reconfigure
```
# Workload Identity on GKE

* [How to setup GKE Workload Identity](https://surajblog.medium.com/workload-identity-in-gke-with-terraform-9678a7a1d9c0)

# Enable GCP services (APIs)

Those 2 services cannot be enabled through terraform

```sh
gcloud services enable cloudresourcemanager.googleapis.com
gcloud services enable serviceusage.googleapis.com
```

# GitLab CI x GCP Workload Identity Federation

* [Working example](https://gitlab.com/guided-explorations/gcp/configure-openid-connect-in-gcp/-/tree/main?ref_type=heads)

# GitLab CI identity federation with GCP

* GitLab runner identity
* Give GCP permissions
  * either thourgh service account impersonation
  * or by giving IAM permissions directly to the GitLab identity, but it seems it's only possible with GitHub runners? dunno

Todo:

* Create a workload identity federation pool
* Create a provider for each identity provider we want to federate (e.g. 1 for GitLab, 1 for GitHub)
* Set permissions
  * service account + impersonation
  * or direct permissions to provider identity

TF module: https://github.com/GestaltCaius/gcp-workload-identity-federation

# Examples

## GitHub Actions 

xx

## GitLab CI 

xxx
