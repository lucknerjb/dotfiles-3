#!/bin/bash
# kill fricking ubersicht with its damn name

_kill() {
    sic=( $( ps aux|grep -i sicht|grep Applications|awk '{print $2}' ) )
    for pid in $sic; do printf "killing pid: $pid ...\n"; kill -9 $pid; done
}

_open() {
    printf "Starting app (takes a few seconds) ...\n"
    open -a /Applications/Übersicht.app
}

if [[ -n "$1" ]]; then
    if [[ "$1" == "-k" ]]; then
        _kill
    elif [[ "$1" == "-r" ]]; then
        osascript -e 'tell application "Übersicht" to refresh'
    else
        print "incorrect usage: -r|-k"
    fi
else
    _kill
    sleep 2
    _open
fi
