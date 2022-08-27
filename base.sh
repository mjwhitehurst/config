#############################################
#       Base script to call all others      #
#############################################

export MATTS_CONFIG="ENABLED"
export CONFIG_DIR=$HOME/.matt_config


if [[ "$1" == "-help" ]]; then
    export DISPLAY_HELP=$1
else
    export DISPLAY_HELP=""
fi



if [[ $- == *i* ]] && tty -s; then
    if [[ -d $CONFIG_DIR ]]; then
        if [[ -f $CONFIG_DIR/shell_colours.sh ]]; then
            if [[ -f $CONFIG_DIR/script_funcs.sh ]]; then
                #Basic script functions - printing etc. assumed colours are set up.
                source $CONFIG_DIR/script_funcs.sh
                ## Main Setup here? ##

                HelpText "===== Got Colours and base functions, beginning actual setup ====="

                ## Sort out my useful aliases
                if [[ -f $CONFIG_DIR/aliases.sh ]]; then
                    HelpText "---- Aliases ----"
                    source $CONFIG_DIR/aliases.sh
                    HelpText "-----------------"
                fi


                ## Set up SSH ##
                HelpText "---- SSH ----"
                SetupOwnSsh;
                HelpText "-----------------"

                ## PS1 ##
                if [[ -f $CONFIG_DIR/ps1.sh ]]; then
                    HelpText "---- PS1 ----"
                    source $CONFIG_DIR/ps1.sh
                    HelpText "-----------------"
                fi

            else
                echo "script funcs missing :("
            fi
        else
            echo "script colours missing :("
        fi
    else
        echo "config dir missing! all config stuff needs to be in \$HOME/config"
    fi #if config dir exists
else
    echo " --- noninteractive session ---"
fi

