autoload -U colors && colors
R="%{$fg[red]%}"
G="%{$fg[green]%}"
B="%{$fg[blue]%}"
Y="%{$fg[yellow]%}"
RESET="%{$reset_color%}"
PS1="${R}%n${RESET}@${G}%m ${Y}%1~ ${B}%# ${RESET}"

export PATH="$PATH:$HOME/dev/android/platform-tools"
export PATH="$PATH:$HOME/dev/flutter/bin/"
eval "$(ssh-agent -s)" >/dev/null
export PATH="/opt/homebrew/opt/ruby/bin:$PATH"
export PATH="$PATH":"$HOME/.pub-cache/bin"
export GEM_HOME=$HOME/.gem
export PATH=$GEM_HOME/bin:$PATH

