kubectl config use-context admin@talos-proxmox-cluster &> /dev/null
kubectl delete -f /home/user/cpu-stressor/cpu-stressor-deploy50.yaml 2> /dev/null
kubectl delete -f /home/user/cpu-stressor/cpu-stressor-deploy95.yaml 2> /dev/null
kubectl config use-context admin@talos-proxmox-cluster2 &> /dev/null
kubectl delete -f /home/user/cpu-stressor/cpu-stressor-deploy50.yaml 2> /dev/null
kubectl delete -f /home/user/cpu-stressor/cpu-stressor-deploy95.yaml 2> /dev/null