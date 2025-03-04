#узнать текущий лимит istio sidecar на поде
kubectl config use-context admin@talos-proxmox-cluster2
iperf3_client=`kubectl get pod -l app=iperf3-istio-istio -o jsonpath="{.items[0].metadata.name}"`
kubectl get pod ${iperf3_client} -o json | jq '.spec.containers[] | select(.name == "istio-proxy") | .resources'
