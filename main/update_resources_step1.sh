SCRIPTS_DIR=/home/user/iperf3-scripts/resources/step1

#cluster1
kubectl config use-context admin@talos-proxmox-cluster

#istio-deployment
  #sidecar
  kubectl patch deployment iperf3-istio-deployment --patch "$(cat $SCRIPTS_DIR/resources_istio_sidecar.yaml)"
  kubectl patch deployment iperf3-istio-deployment-2 --patch "$(cat $SCRIPTS_DIR/resources_istio_sidecar.yaml)"
  #iperf3-container
  kubectl patch deployment iperf3-istio-deployment --patch "$(cat $SCRIPTS_DIR/resources_dp1_istio_iperf3.yaml)"
  kubectl patch deployment iperf3-istio-deployment-2 --patch "$(cat $SCRIPTS_DIR/resources_dp2_istio_iperf3.yaml)"

#nonistio-deployment
kubectl patch deployment iperf3-deployment -n iperf3 --patch "$(cat $SCRIPTS_DIR/resources_dp1_iperf3.yaml)"
kubectl patch deployment iperf3-deployment-2 -n iperf3 --patch "$(cat $SCRIPTS_DIR/resources_dp2_iperf3.yaml)"

#cluster2
kubectl config use-context admin@talos-proxmox-cluster2

#istio-deployment
  #sidecar
  kubectl patch deployment iperf3-istio-deployment --patch "$(cat $SCRIPTS_DIR/resources_istio_sidecar.yaml)"
  kubectl patch deployment iperf3-istio-deployment-2 --patch "$(cat $SCRIPTS_DIR/resources_istio_sidecar.yaml)"
  #iperf3-container
  kubectl patch deployment iperf3-istio-deployment --patch "$(cat $SCRIPTS_DIR/resources_dp1_istio_iperf3.yaml)"
  kubectl patch deployment iperf3-istio-deployment-2 --patch "$(cat $SCRIPTS_DIR/resources_dp2_istio_iperf3.yaml)"

#nonistio-deployment
kubectl patch deployment iperf3-deployment -n iperf3 --patch "$(cat $SCRIPTS_DIR/resources_dp1_iperf3.yaml)"
kubectl patch deployment iperf3-deployment-2 -n iperf3 --patch "$(cat $SCRIPTS_DIR/resources_dp2_iperf3.yaml)"