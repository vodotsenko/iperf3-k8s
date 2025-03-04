#остановить сервак
kubectl config use-context admin@talos-proxmox-cluster2
iperf3_server=`kubectl get pod -l app=iperf3-istio -n default -o jsonpath="{.items[0].metadata.name}"`
kubectl exec -n default ${iperf3_server} -c iperf3-istio -- bash -c "pkill iperf3"
echo "stoped iperf3 server=${iperf3_server}"