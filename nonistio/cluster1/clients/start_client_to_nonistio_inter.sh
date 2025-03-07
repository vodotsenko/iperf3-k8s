#запустить клиента (noistio)
cluster="cluster"
kubectl config use-context admin@talos-proxmox-$cluster &> /dev/null
iperf3_client=`kubectl get pod -n iperf3 -l app=iperf3 -o jsonpath="{.items[0].metadata.name}"`

#старт второго пода или проверка, что под запущен
if [ $(kubectl get deployment -n iperf3 iperf3-deployment-2 -o jsonpath="{.spec.replicas}") -lt 1 ]; then
  kubectl apply -f /home/user/iperf3-nonistio/svc-iperf3-2.yaml
  kubectl apply -f /home/user/iperf3-nonistio/deploy-iperf3-2.yaml
  iperf3_client2=`kubectl get pod -n iperf3 -l app=iperf3-2 -o jsonpath="{.items[0].metadata.name}"`
  until $(kubectl get pod "${iperf3_client2}" -n iperf3 -o jsonpath='{.status.containerStatuses[0].ready}'); do
    echo "Waiting for ${iperf3_client2} to start..."
    sleep 3
  done
fi

iperf3_svc_ip=`kubectl get svc -n iperf3 iperf3-svc-2 --output jsonpath="{.status.loadBalancer.ingress[0].ip}"`

export iperf3_client iperf3_svc_ip cluster
/home/user/iperf3-scripts/nonistio/start_test_from_nonistio.sh