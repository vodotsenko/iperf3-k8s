SCRIPT_DIR=$(dirname "$(realpath "$BASH_SOURCE")")

#остановить кластер 1 сервак 1
$SCRIPT_DIR/cluster1/servers/stop_srv1.sh
#остановить кластер 1 сервак 2
$SCRIPT_DIR/cluster1/servers/stop_srv2.sh

#остановить кластер 2 сервак 1
$SCRIPT_DIR/cluster2/servers/stop_srv1.sh
#остановить кластер 2 сервак 2
$SCRIPT_DIR/cluster2/servers/stop_srv2.sh
