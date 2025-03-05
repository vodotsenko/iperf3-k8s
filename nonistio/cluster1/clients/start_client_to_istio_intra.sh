#запустить клиента (noistio)
kubectl config use-context admin@talos-proxmox-cluster2
iperf3_svc_ip=`kubectl get svc -n istio-system istio-ingressgateway --output jsonpath="{.status.loadBalancer.ingress[0].ip}"`

kubectl config use-context admin@talos-proxmox-cluster
iperf3_client=`kubectl get pod -n iperf3 -l app=iperf3 -o jsonpath="{.items[0].metadata.name}"`

export iperf3_client iperf3_svc_ip
/home/user/iperf3-scripts/nonistio/start_test_from_nonistio.sh