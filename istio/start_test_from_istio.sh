#запустить клиента (istio)
#kubectl exec -it ${iperf3_client} -n default -c iperf3-istio -- bash -c "iperf3 -c ${iperf3_svc_ip}"
echo "kubectl exec -it $iperf3_client -n default -c iperf3-istio -- bash -c \"traceroute $iperf3_svc_ip -q 1\""
