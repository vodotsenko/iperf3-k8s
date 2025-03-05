SCRIPT_DIR=$(dirname "$(realpath "$BASH_SOURCE")")

#запустить кластер 2 сервак 1
$SCRIPT_DIR/cluster2/servers/start_srv1.sh
#запустить кластер 2 сервак 2
$SCRIPT_DIR/cluster2/servers/start_srv2.sh
