#запустить сервак (nonistio)
kubectl config use-context admin@talos-proxmox-cluster2 &> /dev/null
iperf3_server=`kubectl get pod -l app=iperf3 -n iperf3 -o jsonpath="{.items[0].metadata.name}"`
kubectl exec -n iperf3 ${iperf3_server} -c iperf3 -- bash -c "nohup iperf3 -s >> /tmp/listen.txt 2>&1 &"
echo "started iperf3 server=${iperf3_server}"