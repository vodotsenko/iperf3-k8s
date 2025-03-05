#запустить клиента (istio)
kubectl config use-context admin@talos-proxmox-cluster
iperf3_svc_ip=`kubectl get svc -n iperf3 iperf3-svc --output jsonpath="{.status.loadBalancer.ingress[0].ip}"`

kubectl config use-context admin@talos-proxmox-cluster2
iperf3_client=`kubectl get pod -n default -l app=iperf3-istio -o jsonpath="{.items[0].metadata.name}"`

export iperf3_client iperf3_svc_ip
/home/user/iperf3-scripts/istio/start_test_from_istio.sh