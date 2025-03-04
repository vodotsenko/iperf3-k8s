#запустить клиента (noistio)
kubectl config use-context admin@talos-proxmox-cluster
iperf3_client=`kubectl get pod -n default -l app=iperf3-istio -o jsonpath="{.items[0].metadata.name}"`


#старт второго пода или проверка, что под запущен
kubectl apply -f /home/user/iperf3-nonistio/svc-iperf3-2.yaml
kubectl apply -f /home/user/iperf3-nonistio/deploy-iperf3-2.yaml
iperf3_client2=`kubectl get pod -n default -l app=iperf3-istio-2 -o jsonpath="{.items[0].metadata.name}"`

until $(kubectl get pod "${iperf3_client2}" -n default -o jsonpath='{.status.containerStatuses[0].ready}'); do
    echo "Waiting for ${iperf3_client2} to start..."
    sleep 3
done

iperf3_svc_ip=`kubectl get svc -n default iperf3-svc-2 --output jsonpath="{.status.loadBalancer.ingress[0].ip}"`
kubectl exec -it ${iperf3_client} -n default -c iperf3-istio -- bash -c "iperf3 -c ${iperf3_svc_ip}"