#рестарт пода
kubectl config use-context admin@talos-proxmox-cluster
iperf3_server=`kubectl get pod -l app=iperf3 -n default -o jsonpath="{.items[0].metadata.name}"`
kubectl rollout restart deployment -n default iperf3-deployment
echo "pod restarted ${iperf3_server}"