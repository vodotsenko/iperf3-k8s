SCRIPT_DIR=$(dirname "$(realpath "$BASH_SOURCE")")

#запустить кластер 1 сервак 1
$SCRIPT_DIR/cluster1/servers/restart_pod_srv1.sh
#запустить кластер 1 сервак 2
$SCRIPT_DIR/cluster1/servers/restart_pod_srv2.sh

#запустить кластер 2 сервак 1
$SCRIPT_DIR/cluster2/servers/restart_pod_srv1.sh
#запустить кластер 2 сервак 2
$SCRIPT_DIR/cluster2/servers/restart_pod_srv2.sh