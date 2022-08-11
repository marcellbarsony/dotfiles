#!/bin/sh

run() {
    if ! pgrep $1 ; then
        $@&
    fi
}

run kitty
