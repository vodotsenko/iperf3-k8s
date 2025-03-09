kubectl config use-context admin@talos-proxmox-cluster &> /dev/null
a=$(kubectl apply -f /home/user/cpu-stressor/cpu-stressor-deploy50.yaml); echo "cluster1 > $a"
sleep 4
kubectl rollout status deployment/cpu-stressor-deployment -n iperf3
cpu_stressor=`kubectl get pod -n iperf3 -l app=cpu-stressor -o jsonpath="{.items[0].metadata.name}"`
until $(kubectl get pod $cpu_stressor -n iperf3 -o jsonpath='{.status.containerStatuses[0].ready}'); do
  echo "Waiting for ${cpu_stressor} to start..."
  sleep 2
done

kubectl config use-context admin@talos-proxmox-cluster2 &> /dev/null &> /dev/null
a=$(kubectl apply -f /home/user/cpu-stressor/cpu-stressor-deploy50.yaml); echo "cluster2 > $a"
sleep 4
kubectl rollout status deployment/cpu-stressor-deployment -n iperf3
cpu_stressor=`kubectl get pod -n iperf3 -l app=cpu-stressor -o jsonpath="{.items[0].metadata.name}"`
until $(kubectl get pod $cpu_stressor -n iperf3 -o jsonpath='{.status.containerStatuses[0].ready}'); do
  echo "Waiting for ${cpu_stressor} to start..."
  sleep 2
done