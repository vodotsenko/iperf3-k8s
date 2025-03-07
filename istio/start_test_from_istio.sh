#запустить клиента (istio)
#echo "kubectl exec -it $iperf3_client -n default -c iperf3-istio -- bash -c \"traceroute $iperf3_svc_ip -q 1\""

kubectl config use-context admin@talos-proxmox-$cluster &> /dev/null
start_test_1P="kubectl exec -it ${iperf3_client} -n default -c iperf3-istio -- bash -c \"iperf3 -c ${iperf3_svc_ip} -t 2\""
start_test_2P="kubectl exec -it ${iperf3_client} -n default -c iperf3-istio -- bash -c \"iperf3 -c ${iperf3_svc_ip} -t 2 -P 2\""

export start_test_1P start_test_2P cluster

/home/user/iperf3-scripts/main/step_by_step_run.sh