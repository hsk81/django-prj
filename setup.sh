#!/bin/bash

ACTMETH=${1}
APPNAME=${2-"django-prj"}
OPTIONS=${3-""}

###############################################################################
###############################################################################

function pipit () {
    pip install $1 django
}

###############################################################################
###############################################################################

function vexec_pip () {
    if [ -f bin/activate ] ; then
        source bin/activate
        if [ $VIRTUAL_ENV ] ; then
            pipit $1 ; deactivate
        fi
    fi
}

###############################################################################
###############################################################################

function setup_env () {
    if [ $VIRTUAL_ENV ] ; then
        exit 0
    else
        git submodule update --init
        virtualenv . --prompt="[$1] "
    fi
}

function clear_env () {
    if [ $VIRTUAL_ENV ] ; then
        deactivate
    fi

    rm bin/ include/ lib/ -r
}


###############################################################################
###############################################################################

case $ACTMETH in
    clear)
        clear_env ;;
    init)
        setup_env $APPNAME && vexec_pip $OPTIONS ;;
    *)
        $0 init $1 $2 ;;
esac

###############################################################################
###############################################################################

exit 0 ;
