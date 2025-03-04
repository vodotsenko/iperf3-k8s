#узнать текущий лимит istio iperf3 на поде
kubectl config use-context admin@talos-proxmox-cluster
iperf3_client=`kubectl get pod -n iperf3 -l app=iperf3 -o jsonpath="{.items[0].metadata.name}"`
kubectl get pod ${iperf3_client} -n iperf3 -o json | jq '.spec.containers[] | select(.name == "iperf3") | .resources'