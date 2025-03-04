#статус iperf3 (nonistio)
kubectl config use-context admin@talos-proxmox-cluster2
iperf3_server=`kubectl get pod -l app=iperf3-istio-2 -n default -o jsonpath="{.items[0].metadata.name}"`
kubectl exec -n default ${iperf3_server} -c iperf3-istio-2 -- bash -c "ps aux | grep -w S | grep -v 'grep'"