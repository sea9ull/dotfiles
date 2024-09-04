#!/usr/bin/bash

SCRIPT_DIR=$(cd $(dirname $0); pwd)
DOTFILES_DIR=$SCRIPT_DIR
# DOTFILES_DIR=$HOME/env/dotfiles
REPOSITORY=$DOTFILES_DIR/repository
APPS=$DOTFILES_DIR/use_list.txt
XDG_CONFIG_HOME=$HOME/.config

if [ ! -d $XDG_CONFIG_HOME ]; then
    mkdir $XDG_CONFIG_HOME
fi

function print_debug (){
    #DEBUG=1
    DEBUG=
    if [ -n "$DEBUG" ]; then
        echo $1
    fi
}

function bind_dir() {
    src="$1"
    dst="$2"
    if [ ! -d "$dst" ]; then
        mkdir -p "$dst"
    fi
    find $src -type f | while read -r config; do
        dst_dir=$(dirname $config | sed "s;$src;$dst;")
        dst_file=$(basename $config)
        if [ ! -d "$dst_dir" ]; then
            mkdir -p $dst_dir
        fi
    	if [ "${dst_file:0:1}" == "_" ]; then
    	    dst_file=".${dst_file:1}"
    	fi
        bind_file "$config" "$dst_dir/$dst_file"
    done
}

function bind_file() {
    base="$1"
    link="$2"
    echo "[bind] $src ==> $link"
    ln -sf "$base" "$link" 
}

function bind_config() {
    PARAMS=(${1//:/ })
    from=${PARAMS[0]}
    to=${PARAMS[1]}
    if [ -n "$from" ] && [ -n "$to" ]; then
        if [ -d "$from" ]; then
            bind_dir "$from" "$to"
        fi
        if [ ! -d "$from" ] && [ -e "$from" ]; then
            bind_file "$from" "$to"
        fi
    else
        print_debug "[error] invalid parameter : $1"
    fi
}

cat $APPS | while read line; do
    ARR=(${line//\// })
    app=${ARR[0]}
    theme=${ARR[1]}

    if [ -z "$theme" ]; then
        theme="default"
    fi
    theme="$theme.theme"
    settings=$REPOSITORY/$app

    if [ -e $settings/$theme ]; then
        BIND_CONFIG=
        BIND_HOME=
        print_debug "[load] $settings/$theme"
        source $settings/$theme
        ## at XDG Config Directory
        if [ -n "$BIND_CONFIG" ]; then
            print_debug "[bind-config] $BIND_CONFIG"
            bind_config "$settings/$BIND_CONFIG"
        fi
        ## at Home Directory
        if [ -n "$BIND_HOME" ]; then
            print_debug "[bind-home] $BIND_HOME"
            bind_config "$settings/$BIND_HOME"
        fi
    else
        print_debug "no theme exists [$settings/$theme]"
    fi
done
