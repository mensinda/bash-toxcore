#!/bin/bash

cd "$(dirname "$0")"

[ ! -d bashUtils ] && git clone --recursive https://github.com/mensinda/bashUtils
[ -d .FIFOs ] && rm -rf .FIFOs
mkdir .FIFOs

# Load bashUtils
source bashUtils/loader.sh
loadBashUtils

# Load the binding
source toxcore.sh


# Create a binding object
# Constructor parameters:
#  - root path of the binding source
#  - a path to a directory for FIFO's used by the binding (should be empty)
BashToxcore binding "$(pwd)" "$(pwd)/.FIFOs"

#binding . bbind_option_useGDB 'true'

binding . bbind_getIsCompiled
(( $? != 0 )) && binding . bbind_compile # Generate and compile the binding c code
binding . bbind_start                    # Sets everything up and starts the binding

binding . tox_options_new ; TOX_OPTS="$OUT_0"
# The first return value will be stored in OUT_0

# OUT_1 is the address of error, OUT_2 the value of error
# --> pointer commes always first
msg1 "Created new option struct. ERROR: $OUT_2"

binding . tox_options_default "$TOX_OPTS"
binding . tox_new             "$TOX_OPTS" ; TOX="$OUT_0"
msg1 "Created TOX. ERROR: $OUT_2"

binding . tox_options_free    "$TOX_OPTS"


binding . tox_iteration_interval "$TOX" ; INTERVAL="$OUT_0"

msg1 "Iteration interval is $INTERVAL ms"

binding . tox_kill "$TOX"

binding destruct # Automatic cleanup
# accessing 'binding' after this point will generate errors!


[ -d .FIFOs ] && rm -rf .FIFOs
