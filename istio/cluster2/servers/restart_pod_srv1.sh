#рестарт пода
kubectl config use-context admin@talos-proxmox-cluster2
kubectl rollout restart deployment -n default iperf3-istio-deployment
iperf3_server=`kubectl get pod -l app=iperf3-istio -n default -o jsonpath="{.items[0].metadata.name}"`

until $(kubectl get pod "${iperf3_server}" -n default -o jsonpath='{.status.containerStatuses[0].ready}'); do
    echo "Waiting for ${iperf3_server} to start..."
    sleep 3
done

echo "pod restarted ${iperf3_server}"
