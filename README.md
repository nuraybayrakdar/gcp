Proje Özeti

1. Terraform ile GKE Cluster oluşturuldu, logging ve monitoring özellikleri devre dışı bırakıldı.
2 Node Pool kuruldu:
main-pool (autoscaling kapalı, n2d makine tipi, europe-west1-b)
application-pool (autoscaling 1-3 node arası, n2d makine tipi, europe-west1-b)

2. Kubernetes üzerinde örnek uygulama nginx-app deploy edildi.
Bu uygulama random log generate ediyor ve bu loglar Fluentbit ile toplanıp Elasticsearch’e aktarılıyor.

3. Uygulama için HPA etkinleştirildi, CPU %25 üzeri kullanımda 1-3 pod arası otomatik ölçeklendirme yapıyor.
KEDA aktifleştirilince çakışmadan dolayı disable edildi.

4. Cluster’a Prometheus ve Grafana kuruldu; Kubernetes metrikleri Prometheus’a aktarıldı.
Grafana’da pod restart,container readiness alertleri ve service status dashboard oluşturuldu.

5. Cluster’a KEDA kuruldu ve HPA, KEDA ile nginc-app için auto sclaing yapılabilir hale getirildi.

6. Istio kuruldu ve sidecar olarak nginx-app poduna inject edildi.

7. Ingress nginx controller, elasticsearch, kibana ve fluentbit kurulumları yapıldı.
Elasticsearch’te k8s logları için ILM policy tanımlandı ve 1 günlük retention ayarlandı.

