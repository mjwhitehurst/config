#############################################
#       Base script to call all others      #
#############################################

export MATTS_CONFIG="ENABLED"
export CONFIG_DIR=$HOME/config





if [[ ! -d $CONFIG_DIR ]]; then
    echo "config dir missing! all config stuff needs to be in \$HOME/config"
else
    if [[ -f $CONFIG_DIR/script_funcs.sh ]]; then
        source $CONFIG_DIR/script_funcs.sh
    else
        echo "script funcs missing :("
    fi
fi #if config dir exists

