SCRIPTS_DIR=/home/user/iperf3-scripts

# envoy 100m  128Mi / 200m 256Mi
# iperf3 100m  128Mi /  100m 128Mi
echo internode
  echo source nonistio
    echo destination nonistio
      echo cluster1
        $SCRIPTS_DIR/nonistio/cluster1/clients/start_client_to_nonistio_inter.sh






echo internode
  echo source istio
    echo destination istio
      echo cluster1
      $SCRIPTS_DIR/istio/cluster1/clients/start_client_to_istio_inter.sh
      echo cluster2
      $SCRIPTS_DIR/istio/cluster2/clients/start_client_to_istio_inter.sh
    echo destination nonistio
      echo cluster1
      $SCRIPTS_DIR/istio/cluster1/clients/start_client_to_nonistio_inter.sh
      echo cluster2
      $SCRIPTS_DIR/istio/cluster1/clients/start_client_to_nonistio_inter.sh
  echo source nonistio
    echo destination istio
      echo cluster1
      $SCRIPTS_DIR/nonistio/cluster1/clients/start_client_to_istio_inter.sh
      echo cluster2
      $SCRIPTS_DIR/nonistio/cluster2/clients/start_client_to_istio_inter.sh
    echo destination nonistio
      echo cluster1
      $SCRIPTS_DIR/nonistio/cluster1/clients/start_client_to_nonistio_inter.sh
      echo cluster2
      $SCRIPTS_DIR/nonistio/cluster1/clients/start_client_to_nonistio_inter.sh

echo intranode
  echo source istio
    echo destination istio
      echo cluster1
      $SCRIPTS_DIR/istio/cluster1/clients/start_client_to_istio_intra.sh
      echo cluster2
      $SCRIPTS_DIR/istio/cluster2/clients/start_client_to_istio_intra.sh
    echo destination nonistio
      echo cluster1
      $SCRIPTS_DIR/istio/cluster1/clients/start_client_to_nonistio_intra.sh
      echo cluster2
      $SCRIPTS_DIR/istio/cluster1/clients/start_client_to_nonistio_intra.sh
  echo source nonistio
    echo destination istio
      echo cluster1
      $SCRIPTS_DIR/nonistio/cluster1/clients/start_client_to_istio_intra.sh
      echo cluster2
      $SCRIPTS_DIR/nonistio/cluster2/clients/start_client_to_istio_intra.sh
    echo destination nonistio
      echo cluster1
      $SCRIPTS_DIR/nonistio/cluster1/clients/start_client_to_nonistio_intra.sh
      echo cluster2
      $SCRIPTS_DIR/nonistio/cluster1/clients/start_client_to_nonistio_intra.sh