#запустить клиента (noistio)
kubectl config use-context admin@talos-proxmox-cluster
iperf3_svc_ip=`kubectl get svc -n istio-system istio-ingressgateway --output jsonpath="{.status.loadBalancer.ingress[0].ip}"`

kubectl config use-context admin@talos-proxmox-cluster2
iperf3_client=`kubectl get pod -n iperf3 -l app=iperf3 -o jsonpath="{.items[0].metadata.name}"`
kubectl exec -it ${iperf3_client} -n iperf3 -c iperf3 -- bash -c "iperf3 -c ${iperf3_svc_ip}"