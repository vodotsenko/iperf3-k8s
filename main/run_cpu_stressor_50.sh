kubectl config use-context admin@talos-proxmox-$cluster
#50%
echo "нагрузка на кластер 50%"
kubectl apply -f /home/user/cpu-stressor/cpu-stressor-deploy.yaml
sleep 2
cpu_stressor=`kubectl get pod -n iperf3 -l app=cpu-stressor -o jsonpath="{.items[0].metadata.name}"`
until $(kubectl get pod $cpu_stressor -n iperf3 -o jsonpath='{.status.containerStatuses[0].ready}'); do
  echo "Waiting for ${cpu_stressor} to start..."
  sleep 2
done
