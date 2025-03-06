#запустить клиента (istio)
#echo "kubectl exec -it $iperf3_client -n default -c iperf3-istio -- bash -c \"traceroute $iperf3_svc_ip -q 1\""

kubectl config use-context admin@talos-proxmox-$cluster
start_test_1P="kubectl exec -it ${iperf3_client} -n default -c iperf3-istio -- bash -c \"iperf3 -c ${iperf3_svc_ip} -t 2\""
start_test_60P="kubectl exec -it ${iperf3_client} -n default -c iperf3-istio -- bash -c \"iperf3 -c ${iperf3_svc_ip} -t 2 -P 10\""

echo "без внешней нагрузки"
eval $start_test_1P; eval $start_test_60P

echo "нагрузка на кластер 50%"
kubectl apply -f /home/user/cpu-stressor/cpu-stressor-deploy.yaml
sleep 2
cpu_stressor=`kubectl get pod -n iperf3 -l app=cpu-stressor -o jsonpath="{.items[0].metadata.name}"`
until $(kubectl get pod $cpu_stressor -n iperf3 -o jsonpath='{.status.containerStatuses[0].ready}'); do
  echo "Waiting for ${cpu_stressor} to start..."
  sleep 2
done

sleep 3
eval $start_test_1P; eval $start_test_60P

echo "нагрузка на кластер 95%"

kubectl patch deployment cpu-stressor-deployment -n iperf3 --patch "$(cat /home/user/cpu-stressor/cs-patch-95proc.yaml)"
sleep 5
kubectl rollout status deployment/cpu-stressor-deployment -n iperf3
cpu_stressor=`kubectl get pod -n iperf3 -l app=cpu-stressor -o jsonpath="{.items[0].metadata.name}"`
until $(kubectl get pod $cpu_stressor -n iperf3 -o jsonpath='{.status.containerStatuses[0].ready}'); do
  echo "Waiting for ${cpu_stressor} to start..."
  sleep 2
done

eval $start_test_1P; eval $start_test_60P

#удаляем cpu stressor
kubectl delete -f /home/user/cpu-stressor/cpu-stressor-deploy.yaml