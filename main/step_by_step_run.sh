#удаляем cpu stressor
/home/user/iperf3-scripts/main/delete_cpu_stressor.sh
kubectl config use-context admin@talos-proxmox-$cluster &> /dev/null

echo "без внешней нагрузки"
eval $start_test_1P

echo "нагрузка на кластер 50%"
/home/user/iperf3-scripts/main/run_cpu_stressor_50.sh
kubectl config use-context admin@talos-proxmox-$cluster &> /dev/null

sleep 3
eval $start_test_1P

echo "нагрузка на кластер 95%"
/home/user/iperf3-scripts/main/run_cpu_stressor_95.sh
kubectl config use-context admin@talos-proxmox-$cluster &> /dev/null

eval $start_test_1P

#удаляем cpu stressor
/home/user/iperf3-scripts/main/delete_cpu_stressor.sh
kubectl config use-context admin@talos-proxmox-$cluster &> /dev/null

echo "без внешней нагрузки"
eval $start_test_2P

echo "нагрузка на кластер 50%"
/home/user/iperf3-scripts/main/run_cpu_stressor_50.sh
kubectl config use-context admin@talos-proxmox-$cluster &> /dev/null

sleep 3
eval $start_test_2P

echo "нагрузка на кластер 95%"
/home/user/iperf3-scripts/main/run_cpu_stressor_95.sh
kubectl config use-context admin@talos-proxmox-$cluster &> /dev/null

eval $start_test_2P

#удаляем cpu stressor
/home/user/iperf3-scripts/main/delete_cpu_stressor.sh
kubectl config use-context admin@talos-proxmox-$cluster &> /dev/null