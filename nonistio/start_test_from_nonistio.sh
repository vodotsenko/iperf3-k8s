#запустить клиента (istio)
#echo "kubectl exec -it $iperf3_client -n iperf3 -c iperf3 -- bash -c \"traceroute $iperf3_svc_ip -q 1\""

kubectl config use-context admin@talos-proxmox-$cluster
start_test_1P="kubectl exec -it ${iperf3_client} -n iperf3 -c iperf3 -- bash -c \"iperf3 -c ${iperf3_svc_ip} -t 2\""
start_test_10P="kubectl exec -it ${iperf3_client} -n iperf3 -c iperf3 -- bash -c \"iperf3 -c ${iperf3_svc_ip} -t 2 -P 10\""
export $cluster

echo "без внешней нагрузки"
eval $start_test_1P

echo "нагрузка на кластер 95%"
/home/user/iperf3-scripts/main/run_cpu_stressor_50.sh

sleep 3
eval $start_test_1P

echo "нагрузка на кластер 95%"
/home/user/iperf3-scripts/main/run_cpu_stressor_95.sh

eval $start_test_10P

#удаляем cpu stressor
kubectl delete -f /home/user/cpu-stressor/cpu-stressor-deploy.yaml

echo "без внешней нагрузки"
eval $start_test_10P

echo "нагрузка на кластер 95%"
/home/user/iperf3-scripts/main/run_cpu_stressor_50.sh

sleep 3
eval $start_test_10P

echo "нагрузка на кластер 95%"
/home/user/iperf3-scripts/main/run_cpu_stressor_95.sh

eval $start_test_10P

#удаляем cpu stressor
kubectl delete -f /home/user/cpu-stressor/cpu-stressor-deploy.yaml