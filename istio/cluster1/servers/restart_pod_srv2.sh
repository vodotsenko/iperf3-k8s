#рестарт пода
kubectl config use-context admin@talos-proxmox-cluster
iperf3_server=`kubectl get pod -l app=iperf3-2 -n default -o jsonpath="{.items[0].metadata.name}"`
kubectl rollout restart deployment -n default iperf3-deployment-2
echo "pod restarted ${iperf3_server}"