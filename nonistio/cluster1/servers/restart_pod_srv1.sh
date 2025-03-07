#рестарт пода
kubectl config use-context admin@talos-proxmox-cluster &> /dev/null
iperf3_server=`kubectl get pod -l app=iperf3 -n iperf3 -o jsonpath="{.items[0].metadata.name}"`
kubectl rollout restart deployment -n iperf3 iperf3-deployment
echo "pod restarted ${iperf3_server}"