#статус iperf3 (nonistio)
kubectl config use-context admin@talos-proxmox-cluster &> /dev/null
iperf3_server=`kubectl get pod -l app=iperf3-2 -n iperf3 -o jsonpath="{.items[0].metadata.name}"`
kubectl exec -n iperf3 ${iperf3_server} -c iperf3-2 -- bash -c "ps aux | grep -w S | grep -v 'grep'"