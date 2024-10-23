# Check to see if we're logging in through tty1, startx if so

#if [[ -z $DISPLAY ]] && [[ $(tty) = /dev/tty1 ]]; then
#	exec startx
#fi

# Set up the prompt

eval "$(direnv hook zsh)"
export WORDCHARS=''

autoload -U colors && colors
PS1="%B%{$fg[red]%}%n@%M %{$fg[blue]%}%~%{$fg[yellow]%} λ %{$reset_color%}%b"

# Keep 1000 lines of history within the shell and save it to ~/.zsh_history:
HISTSIZE=1000
SAVEHIST=1000
HISTFILE=~/.zsh_history

# Basic auto/tab complete:
autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots)		# Include hidden files.

# word control with ctrl
bindkey '\;5D' backward-word
bindkey '\;5C' forward-word
# bindkey '^H' backward-kill-word
# bindkey '^[[3;5~' kill-word

# word control with alt
# bindkey '\;3D' backward-word
# bindkey '\;3C' forward-word
bindkey '^H' backward-kill-word
bindkey '^[[3;3~' kill-word
bindkey  "^[[3~"  delete-char

bindkey "^[[1;5C" forward-word
bindkey "^[[1;5D" backward-word

# Do nothing when these shortcuts are used
bindkey -s '^V' ''
bindkey -s ';5B' ''
bindkey -s ';5A' ''
bindkey -s ';2A' ''
bindkey -s ';2B' ''
bindkey -s ';2C' ''
bindkey -s ';2D' ''
bindkey -s ';3A' ''
bindkey -s ';3B' ''
bindkey -s ';3C' ''
bindkey -s ';3D' ''
bindkey -s '9;9u' ''

autoload bashcompinit
bashcompinit

(cat ~/.cache/wal/sequences &)

CAPSTONE_TOOLS='/home/ben/Documents/semesters/fall-2023/capstone/software/aquilo/firmware/tools'
export PATH=$PATH:~/Projects/scripts/:/home/ben/.local/bin:$CAPSTONE_TOOLS

# ALIASES
alias open='xdg-open'
alias ls='ls --color=auto'

cd () {
    [ $1 ] && pushd $1 > /dev/null
    [ $1 ] || pushd ~ > /dev/null
}

alias back='popd > /dev/null'
alias matlab='matlab -nodesktop -nodisplay'
alias bc='bc -l'
alias sl='sl -e'
alias blackground='feh --bg-scale "$HOME/Projects/scripts/resources/black.jpg"'
alias whiteground='feh --bg-scale "$HOME/Projects/scripts/resources/white.jpg"'
alias vis-window='i3-sensible-terminal -e "/bin/sh -c \"(cat ~/.cache/wal/sequences & ) && vis\""'
alias szsh='source ~/.zshrc'
alias play='cvlc'
alias sxiv='sxiv -o'
alias icat='kitty +kitten icat'
alias mount-potato='sudo mount.cifs //potato/data /mnt/potato/data -o user=ben,pass=p0t4tOr-Ch1p'
alias udev-reload='sudo udevadm control --reload-rules && sudo udevadm trigger'
alias power-supersave='echo powersupersave | sudo tee /sys/module/pcie_aspm/parameters/policy'
alias power-default='echo default | sudo tee /sys/module/pcie_aspm/parameters/policy'
alias power-get-policy='cat /sys/module/pcie_aspm/parameters/policy'
alias power-performance='echo performance | sudo tee /sys/module/pcie_aspm/parameters/policy'
alias aquilo-build-dir='cd /home/ben/Projects/da16200-sdk/apps/common/examples/Network/TCP_Client/projects/da16200/img'
alias new-node-project='echo "source /usr/share/nvm/init-nvm.sh" >> .envrc && direnv allow .'
alias venv-activate='source ./.venv/bin/activate'
alias nvm-init='source /usr/share/nvm/init-nvm.sh'
alias setup-xarm='source /home/ben/Documents/semesters/spring-2024/microprocessor-based-design/eece4534sdk/environment-setup-cortexa9t2hf-neon-esl-linux-gnueabi && PS1="(xarm) $PS1"'
alias idf-export='source /home/ben/Projects/embedded/esp/esp-idf/export.sh'
alias no-sleep='xset -dpms; xset s off'

find-everywhere () {
    [[ -z "$1" ]] && exit 1
    find / -name "$1" 2> /dev/null
}

export EDITOR='code'
export VISUAL='code'

# ----------------------------------- COURSES ------------------------------

courses="$HOME/Documents/semesters/spring-2024"

courses () {
    cd "$courses/$1"
}

course () {
    cd "$course"
}

setcourse() {
    # Check if course is valid
    foundcourse="0"
    for course in $(folders "$courses"); do [[ "$course" == "$1" ]] && foundcourse="1"; done

    if [[ "$foundcourse" == "1" ]]; then
        echo "$courses/$1" > "$HOME/Documents/semesters/course"
        course="$courses/$1"
	rm "$HOME/course"
        ln -s "$course" "$HOME/course"
        echo "Changed default course to $1"
        cd $course
    else
        echo "Invalid course name."
    fi
}

export course=$(cat "$HOME/Documents/semesters/course")

function _listcourses() {
	COMPREPLY=$(folders "$courses")
}

complete -F _listcourses courses
complete -F _listcourses setcourse

source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh 2>/dev/null
