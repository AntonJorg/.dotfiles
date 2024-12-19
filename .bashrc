#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

[[ -f ~/.welcome_screen ]] && . ~/.welcome_screen

_set_liveuser_PS1() {
    PS1='[\e[32m\u\e[0m at \e[32m\h\e[0m in \W]\$ '
    if [ "$(whoami)" = "liveuser" ] ; then
        local iso_version="$(grep ^VERSION= /usr/lib/endeavouros-release 2>/dev/null | cut -d '=' -f 2)"
        if [ -n "$iso_version" ] ; then
            local prefix="eos-"
            local iso_info="$prefix$iso_version"
            PS1="[\u@$iso_info \W]\$ "
        fi
    fi
}
_set_liveuser_PS1
unset -f _set_liveuser_PS1

# # create tmux session, attach if already running
# # Adapted from https://unix.stackexchange.com/a/113768/347104
# if [ -n "$PS1" ] && [ -z "$TMUX" ]; then
#   # Adapted from https://unix.stackexchange.com/a/176885/347104
#   # Create session 'main' or attach to 'main' if already exists.
#   tmux new-session -A -s main
# fi


ShowInstallerIsoInfo() {
    local file=/usr/lib/endeavouros-release
    if [ -r $file ] ; then
        cat $file
    else
        echo "Sorry, installer ISO info is not available." >&2
    fi
}


alias ls='ls -a --color=auto'
alias ll='ls -lav --ignore=..'   # show long listing of all except ".."
alias l='ls -lav --ignore=.?*'   # show long listing but no hidden dotfiles except "."

[[ "$(whoami)" = "root" ]] && return

[[ -z "$FUNCNEST" ]] && export FUNCNEST=100          # limits recursive functions, see 'man bash'

## Use the up and down arrow keys for finding a command in history
## (you can write some initial letters of the command first).
bind '"\e[A":history-search-backward'
bind '"\e[B":history-search-forward'

################################################################################
## Some generally useful functions.
## Consider uncommenting aliases below to start using these functions.
##
## October 2021: removed many obsolete functions. If you still need them, please look at
## https://github.com/EndeavourOS-archive/EndeavourOS-archiso/raw/master/airootfs/etc/skel/.bashrc

_open_files_for_editing() {
    # Open any given document file(s) for editing (or just viewing).
    # Note1:
    #    - Do not use for executable files!
    # Note2:
    #    - Uses 'mime' bindings, so you may need to use
    #      e.g. a file manager to make proper file bindings.

    if [ -x /usr/bin/exo-open ] ; then
        echo "exo-open $@" >&2
        setsid exo-open "$@" >& /dev/null
        return
    fi
    if [ -x /usr/bin/xdg-open ] ; then
        for file in "$@" ; do
            echo "xdg-open $file" >&2
            setsid xdg-open "$file" >& /dev/null
        done
        return
    fi

    echo "$FUNCNAME: package 'xdg-utils' or 'exo' is required." >&2
}

#------------------------------------------------------------

## Aliases for the functions above.
## Uncomment an alias if you want to use it.
##

# alias ef='_open_files_for_editing'     # 'ef' opens given file(s) for editing
# alias pacdiff=eos-pacdiff
################################################################################

# Modify path
export PATH="$HOME/antonjorg/.local/bin:$PATH"
export PATH="$HOME/antonjorg/.nimble/bin:$PATH"
export PATH="$HOME/.cargo/bin:$PATH"
export PATH="$HOME/go/bin:$PATH"

source /usr/share/nvm/init-nvm.sh

# config management
alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
alias dotfiles-init='chmod u+x .initdotfiles && ~/.initdotfiles'
alias dotfiles-add-changes='dotfiles add -u'

# troubleshooting
alias qtile-log='cat ~/.local/share/qtile/qtile.log'

BATTERY_FILE="/sys/class/power_supply/BAT1/status"

if test -f "$BATTERY_FILE"; then
    alias alacritty='alacritty -o font.size=9'
else
    alias alacritty='alacritty -o font.size=12'
fi

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
#__conda_setup="$('/home/antonjorg/miniconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
#if [ $? -eq 0 ]; then
#    eval "$__conda_setup"
#else
#    if [ -f "/home/antonjorg/miniconda3/etc/profile.d/conda.sh" ]; then
#        . "/home/antonjorg/miniconda3/etc/profile.d/conda.sh"
#    else
#        export PATH="/home/antonjorg/miniconda3/bin:$PATH"
#    fi
#fi
#unset __conda_setup
# <<< conda initialize <<<

alias docker-up='sudo systemctl start docker.service'

# Essential Robotics development environment setup
export ISAAC_ROS_WS=~/workspaces/essential-robotics-dev/
alias rosws='cd ${ISAAC_ROS_WS}'
alias rosdev='${ISAAC_ROS_WS}src/essential-robotics-common/scripts/run_dev.sh -b'
alias rosdev-build='${ISAAC_ROS_WS}src/essential-robotics-common/scripts/run_dev.sh'
alias rosviz='echo TODO: Implement rosviz'
