SCRIPTS_DIR=/home/user/iperf3-scripts

#internode
  #source istio
    #destination istio
      #cluster1
      $SCRIPTS_DIR/istio/cluster1/clients/start_client_to_istio_inter.sh
      #cluster2
      $SCRIPTS_DIR/istio/cluster2/clients/start_client_to_istio_inter.sh
    #destination nonistio
      #cluster1
      $SCRIPTS_DIR/istio/cluster1/clients/start_client_to_nonistio_inter.sh
      #cluster2
      $SCRIPTS_DIR/istio/cluster1/clients/start_client_to_nonistio_inter.sh
  #source nonistio
    #destination istio
      #cluster1
      $SCRIPTS_DIR/nonistio/cluster1/clients/start_client_to_istio_inter.sh
      #cluster2
      $SCRIPTS_DIR/nonistio/cluster2/clients/start_client_to_istio_inter.sh
    #destination nonistio
      #cluster1
      $SCRIPTS_DIR/nonistio/cluster1/clients/start_client_to_nonistio_inter.sh
      #cluster2
      $SCRIPTS_DIR/nonistio/cluster1/clients/start_client_to_nonistio_inter.sh

#intranode
  #source istio
    #destination istio
      #cluster1
      $SCRIPTS_DIR/istio/cluster1/clients/start_client_to_istio_intra.sh
      #cluster2
      $SCRIPTS_DIR/istio/cluster2/clients/start_client_to_istio_intra.sh
    #destination nonistio
      #cluster1
      $SCRIPTS_DIR/istio/cluster1/clients/start_client_to_nonistio_intra.sh
      #cluster2
      $SCRIPTS_DIR/istio/cluster1/clients/start_client_to_nonistio_intra.sh
  #source nonistio
    #destination istio
      #cluster1
      $SCRIPTS_DIR/nonistio/cluster1/clients/start_client_to_istio_intra.sh
      #cluster2
      $SCRIPTS_DIR/nonistio/cluster2/clients/start_client_to_istio_intra.sh
    #destination nonistio
      #cluster1
      $SCRIPTS_DIR/nonistio/cluster1/clients/start_client_to_nonistio_intra.sh
      #cluster2
      $SCRIPTS_DIR/nonistio/cluster1/clients/start_client_to_nonistio_intra.sh