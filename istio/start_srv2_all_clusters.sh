SCRIPT_DIR=$(dirname "$(realpath "$BASH_SOURCE")")

#запустить кластер 1 сервак 2
$SCRIPT_DIR/cluster1/servers/start_srv2.sh
#запустить кластер 1 сервак 2
$SCRIPT_DIR/cluster2/servers/start_srv2.sh

