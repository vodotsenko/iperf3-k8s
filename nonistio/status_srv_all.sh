SCRIPT_DIR=$(dirname "$(realpath "$BASH_SOURCE")")

#запустить кластер 1 сервак 1
$SCRIPT_DIR/cluster1/servers/status_srv1.sh
#запустить кластер 1 сервак 2
$SCRIPT_DIR/cluster1/servers/status_srv2.sh

#запустить кластер 2 сервак 1
$SCRIPT_DIR/cluster2/servers/status_srv1.sh
#запустить кластер 2 сервак 2
$SCRIPT_DIR/cluster2/servers/status_srv2.sh
