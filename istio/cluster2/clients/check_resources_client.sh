#узнать текущий лимит istio iperf3 на поде
kubectl config use-context admin@talos-proxmox-cluster &> /dev/null
iperf3_client=`kubectl get pod -n default -l app=iperf3-istio -o jsonpath="{.items[0].metadata.name}"`
kubectl get pod ${iperf3_client} -n default -o json | jq '.spec.containers[] | select(.name == "iperf3") | .resources'