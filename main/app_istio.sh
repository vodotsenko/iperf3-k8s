SCRIPTS_DIR=/home/user/iperf3-scripts

# istio tests
# envoy 100m  256Mi / 200m 256Mi
# iperf3 50m  128Mi /  100m 256Mi
/home/user/iperf3-scripts/main/update_resources_step1.sh

echo internode
  echo source nonistio
    echo destination istio
      echo nonistio/cluster1/clients/start_client_to_istio_inter.sh
      $SCRIPTS_DIR/nonistio/cluster1/clients/start_client_to_istio_inter.sh

echo intranode
  echo source nonistio
    echo destination istio
      echo nonistio/cluster1/clients/start_client_to_istio_intra.sh
      $SCRIPTS_DIR/nonistio/cluster1/clients/start_client_to_istio_intra.sh

# envoy 100m  256Mi / 200m 256Mi
# iperf3 100m  256Mi /  300m 512Mi
/home/user/iperf3-scripts/main/update_resources_step2.sh

echo internode
  echo source nonistio
    echo destination istio
      echo nonistio/cluster1/clients/start_client_to_istio_inter.sh
      $SCRIPTS_DIR/nonistio/cluster1/clients/start_client_to_istio_inter.sh

echo intranode
  echo source nonistio
    echo destination istio
      echo nonistio/cluster1/clients/start_client_to_istio_intra.sh
      $SCRIPTS_DIR/nonistio/cluster1/clients/start_client_to_istio_intra.sh

# envoy 100m  256Mi / 200m 256Mi
# iperf3 100m  256Mi /  1500m 1024Mi
/home/user/iperf3-scripts/main/update_resources_step3.sh

echo internode
  echo source nonistio
    echo destination istio
      echo nonistio/cluster1/clients/start_client_to_istio_inter.sh
      $SCRIPTS_DIR/nonistio/cluster1/clients/start_client_to_istio_inter.sh

echo intranode
  echo source nonistio
    echo destination istio
      echo nonistio/cluster1/clients/start_client_to_istio_intra.sh
      $SCRIPTS_DIR/nonistio/cluster1/clients/start_client_to_istio_intra.sh