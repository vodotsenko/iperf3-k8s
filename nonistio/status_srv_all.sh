SCRIPT_DIR=$(dirname "$(realpath "$BASH_SOURCE")")

#проверка кластер 1 сервак 1
$SCRIPT_DIR/cluster1/servers/status_srv1.sh
#проверка кластер 1 сервак 2
$SCRIPT_DIR/cluster1/servers/status_srv2.sh

#проверка кластер 2 сервак 1
$SCRIPT_DIR/cluster2/servers/status_srv1.sh
#проверка кластер 2 сервак 2
$SCRIPT_DIR/cluster2/servers/status_srv2.sh
