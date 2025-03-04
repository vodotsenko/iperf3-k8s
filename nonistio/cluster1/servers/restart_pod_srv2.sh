#рестарт пода
kubectl config use-context admin@talos-proxmox-cluster
iperf3_server=`kubectl get pod -l app=iperf3-2 -n iperf3 -o jsonpath="{.items[0].metadata.name}"`
kubectl rollout restart deployment -n iperf3 iperf3-deployment-2
echo "pod restarted ${iperf3_server}"