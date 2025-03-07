kubectl config use-context admin@talos-proxmox-$cluster
#95%
kubectl patch deployment cpu-stressor-deployment -n iperf3 --patch "$(cat /home/user/cpu-stressor/cs-patch-95proc.yaml)"
sleep 5
kubectl rollout status deployment/cpu-stressor-deployment -n iperf3
cpu_stressor=`kubectl get pod -n iperf3 -l app=cpu-stressor -o jsonpath="{.items[0].metadata.name}"`
until $(kubectl get pod $cpu_stressor -n iperf3 -o jsonpath='{.status.containerStatuses[0].ready}'); do
  echo "Waiting for ${cpu_stressor} to start..."
  sleep 2
done
