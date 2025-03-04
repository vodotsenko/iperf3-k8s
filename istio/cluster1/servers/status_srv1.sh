#статус iperf3 (nonistio)
kubectl config use-context admin@talos-proxmox-cluster
iperf3_server=`kubectl get pod -l app=iperf3-istio -n default -o jsonpath="{.items[0].metadata.name}"`
kubectl exec -n default ${iperf3_server} -c iperf3-istio -- bash -c "ps aux | grep -w S | grep -v 'grep'"