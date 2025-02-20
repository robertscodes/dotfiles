
#    _               _              
#   | |__   __ _ ___| |__  _ __ ___ 
#   | '_ \ / _` / __| '_ \| '__/ __|
#  _| |_) | (_| \__ \ | | | | | (__ 
# (_)_.__/ \__,_|___/_| |_|_|  \___|
#
#
# If not running interactively, don't do anything
[[ $- != *i* ]] && return
#PS1='[\u@\h \W]\$ '
PS1="\[\e[1;31m\]\u\[\e[1;32m\]@\h \[\e[1;36m\]\w\[\e[1;33m\]\$ \[\e[0m\]"
#PS2="\[\e[1;32m\]→ \[\e[0m\]"
#PS3=$'\e[1;32mSelect an item: \e[0m'

# -----------------------------------------------------
# LOAD CUSTOM .bashrc_custom if exists
# -----------------------------------------------------
if [ -f ~/.bashrc_custom ] ;then
    source ~/.bashrc_custom
fi

########## EXPORT ################
export PATH="$PATH:/usr/bin/hyprctl"
export EDITOR="/usr/bin/vim"
export VISUAL="/usr/bin/vim"

########## ALIAS ################
alias ls='ls --color=auto'

########## SCRIPTS ##############
# Auto ls after cd
cd() {
  if builtin cd "$@"; then  # Check if cd was successful
    ls --color=auto        # Run ls with color only if cd succeeded
  else
    echo "cd failed" >&2  # Print error message to stderr
    return 1             # Return a non-zero exit code to indicate failure
  fi
}

# Auto cd into dir
mkdircd() {
mkdir -p "$1" && cd "$1"
}

# auto cd into dir after git clone 
gitclone() {
    command git clone "$1" && cd "$(basename "$1" .git)" && command ls
}
