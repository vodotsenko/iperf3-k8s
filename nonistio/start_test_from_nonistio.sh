#запустить клиента (nonistio)
#kubectl exec -it ${iperf3_client} -n iperf3 -c iperf3 -- bash -c "iperf3 -c ${iperf3_svc_ip}"
echo "kubectl exec -it $iperf3_client -n iperf3 -c iperf3 -- bash -c \"traceroute $iperf3_svc_ip -q 1\""
