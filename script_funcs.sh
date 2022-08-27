## standard script funcs.. for printing etc.



# A couple of new lines for formatting
function AddSpace() {
    printf "\n\n"
}



# Print a thing, if we're being verbose
function HelpText(){
    if [[ ! -z $DISPLAY_HELP ]]; then
        info "$1"
    fi
}


# Printing Functions

function info() {
    printf "${CLR_INFO}$1${CLR_END}\n"
}

function success() {
    printf "${CLR_SUCCESS}$1${CLR_END}\n"
}

function warn() {
    printf "${CLR_WARN}$1${CLR_END}\n"
}

function err() (
    printf "${CLR_ERROR}$1${CLR_END}\n"
)


function SetupOwnSsh
{
  SSH_DIR="$HOME/.ssh"
  if [[ ! -d $SSH_DIR ]]
  then
    mkdir $SSH_DIR
    HelpText "Had to generate new SSH Dir at $SSH_DIR"
  fi

  #If it doesn't exist, generate own key
  MY_KEY="$SSH_DIR/id_rsa.pub"
  if [[ ! -f ${MY_KEY} ]]
  then
    err "Own key not found at ${MY_KEY}, generating a new one"
    info "Unless you really care, just press enter for the next 3 prompts"
    sleep 1
    ssh-keygen #this will go through the dialogue to create our key
  else
    HelpText "Own key found at ${MY_KEY}"
  fi

  #If it doesn't exist, create authorised keys file
  OTHER_KEYS="$SSH_DIR/authorized_keys"
  if [[ ! -f ${OTHER_KEYS} ]]
  then
    touch ${OTHER_KEYS} #touch will create it and leave blank
  else
    HelpText "Keys file exists in ${OTHER_KEYS}"
  fi
}






