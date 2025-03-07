#запустить клиента (istio connect via svc NodePort)
cluster="cluster2"
kubectl config use-context admin@talos-proxmox-$cluster &> /dev/null
iperf3_client=`kubectl get pod -n default -l app=iperf3-istio -o jsonpath="{.items[0].metadata.name}"`
iperf3_svc_ip=`kubectl get svc -n default iperf3-istio-svc-2 --output jsonpath="{.spec.clusterIP}"`

export iperf3_client iperf3_svc_ip cluster
/home/user/iperf3-scripts/istio/start_test_from_istio.sh