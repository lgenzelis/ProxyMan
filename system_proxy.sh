#!/bin/bash

CONF_FILE="$HOME/.config/kioslaverc"

list_proxy() {
    # inefficient way as the file is read twice.. think of some better way
    echo
    echo "${bold}System proxy settings : ${normal}"
    lines="$(cat $CONF_FILE | grep ProxyType=1 | wc -l)"
    if [ "$lines" -gt 0 ]; then
        cat "$CONF_FILE"
    else
        echo "${red}No Proxy${normal}"
    fi
}

unset_proxy() {
    if [ ! -e "$CONF_FILE" ]; then
        return
    fi
    lines="$(cat $CONF_FILE | grep ProxyType=1 | wc -l)"
    if [ "$lines" -gt 0 ]; then
        sed -i -- 's/ProxyType=1/ProxyType=0/g' $CONF_FILE
    fi
}

set_proxy() {
    if [ ! -e "$CONF_FILE" ]; then
        touch "$CONF_FILE"
    fi

    local stmt=""
    if [ "$use_auth" = "y" ]; then
        stmt="${username}:${password}@"
    fi

    # caution: do not use / after stmt
    echo "ProxyUrlDisplayFlags=1" > "$CONF_FILE"
    echo "" >> "$CONF_FILE"
    echo "[Proxy Settings]" >> "$CONF_FILE" 
    echo "NoProxyFor=$no_proxy" >> "$CONF_FILE"
    echo "Proxy Config Script=" >> "$CONF_FILE"
    echo "ProxyType=1" >> "$CONF_FILE"
    echo "ReversedException=false" >> "$CONF_FILE"
    if [ -n "$ftp_host" ]; then
        echo "ftpProxy=${stmt}${ftp_host}:${ftp_port}" >> "$CONF_FILE"
    else
        echo "ftpProxy=" >> "$CONF_FILE"
    fi
    echo "httpProxy=${stmt}${http_host}:${http_port}" >> "$CONF_FILE"
    if [ -n "$https_host" ]; then
        echo "httpsProxy=${stmt}${https_host}:${https_port}" >> "$CONF_FILE"
    else
        echo "httpsProxy=" >> "$CONF_FILE"
    fi
    echo "socksProxy=" >> "$CONF_FILE"
}


what_to_do=$1
case $what_to_do in
    set) set_proxy
         ;;
    unset) unset_proxy
           ;;
    list) list_proxy
          ;;
    *)
          ;;
esac
