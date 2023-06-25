# Schedule MongoDB Backup  to S3 using Kubernetes CronJob
## [🐳 Docker Hub](https://hub.docker.com/r/gorniv/k8s-backup-mongodb) | [Medium](https://gorniv3.medium.com/schedule-mongodb-backup-to-s3-using-kubernetes-cronjob-79ca811e1fc0) | [DEV](https://dev.to/gorniv3/schedule-mongodb-backup-to-s3-using-kubernetes-cronjob-2bl7)

![](images/cover.png)

helm repo add k8s-backup-mongodb https://gorniv.github.io/k8s-backup-mongodb

helm install my-k8s-backup-mongodb k8s-backup-mongodb/k8s-backup-mongodb --create-namespace --namespace=my-mongodb-backup --timeout=10m0s --values=my-value.yaml --version=0.1.6

my-value.yaml == filled helm/values.yaml