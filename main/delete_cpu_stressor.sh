kubectl config use-context admin@talos-proxmox-cluster &> /dev/null
kubectl delete -f /home/user/cpu-stressor/cpu-stressor-deploy.yaml
kubectl config use-context admin@talos-proxmox-cluster &> /dev/null
kubectl delete -f /home/user/cpu-stressor/cpu-stressor-deploy.yaml