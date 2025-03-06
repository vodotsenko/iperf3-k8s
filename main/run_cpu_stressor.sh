
#cluster1
kubectl config use-context admin@talos-proxmox-cluster
#50%
kubectl apply -f /home/user/cpu-stressor/cpu-stressor-deploy.yaml
#95%
kubectl patch deployment cpu-stressor-deployment -n iperf3 --patch "$(cat /home/user/cpu-stressor/cs-patch-95proc.yaml)"
#delete
kubectl delete -f /home/user/cpu-stressor/cpu-stressor-deploy.yaml