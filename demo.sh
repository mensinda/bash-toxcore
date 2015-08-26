#!/bin/bash

cd "$(dirname "$0")"

[ ! -d bashUtils ] && git clone --recursive https://github.com/mensinda/bashUtils
[ -d .FIFOs ] && rm -rf .FIFOs
mkdir .FIFOs

source bashUtils/loader.sh
loadBashUtils

source toxcore.sh


BashToxcore binding "$(pwd)" "$(pwd)/.FIFOs"
binding . bbind_compile
binding . bbind_start



binding destruct


[ -d .FIFOs ] && rm -rf .FIFOs
