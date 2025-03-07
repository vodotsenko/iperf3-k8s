SCRIPTS_DIR=/home/user/iperf3-scripts

# nonistio tests
# iperf3 50m  128Mi /  100m 256Mi
/home/user/iperf3-scripts/main/update_resources_step1.sh

echo internode
  echo source nonistio
    echo destination nonistio
      echo nonistio/cluster1/clients/start_client_to_nonistio_inter.sh
      $SCRIPTS_DIR/nonistio/cluster1/clients/start_client_to_nonistio_inter.sh

echo intranode
  echo source nonistio
    echo destination nonistio
      echo nonistio/cluster1/clients/start_client_to_nonistio_intra.sh
      $SCRIPTS_DIR/nonistio/cluster1/clients/start_client_to_nonistio_intra.sh

# iperf3 100m  256Mi /  300m 512Mi
/home/user/iperf3-scripts/main/update_resources_step2.sh
sleep 30

echo internode
  echo source nonistio
    echo destination nonistio
      echo nonistio/cluster1/clients/start_client_to_nonistio_inter.sh
      $SCRIPTS_DIR/nonistio/cluster1/clients/start_client_to_nonistio_inter.sh

echo intranode
  echo source nonistio
    echo destination nonistio
      echo nonistio/cluster1/clients/start_client_to_nonistio_intra.sh
      $SCRIPTS_DIR/nonistio/cluster1/clients/start_client_to_nonistio_intra.sh

# iperf3 100m  256Mi /  1500m 1024Mi
/home/user/iperf3-scripts/main/update_resources_step3.sh
sleep 30

echo internode
  echo source nonistio
    echo destination nonistio
      echo nonistio/cluster1/clients/start_client_to_nonistio_inter.sh
      $SCRIPTS_DIR/nonistio/cluster1/clients/start_client_to_nonistio_inter.sh

echo intranode
  echo source nonistio
    echo destination nonistio
      echo nonistio/cluster1/clients/start_client_to_nonistio_intra.sh
      $SCRIPTS_DIR/nonistio/cluster1/clients/start_client_to_nonistio_intra.sh