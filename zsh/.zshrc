###########
# EXPORTS #
###########
# bins
export PATH=$HOME/bin:$HOME/.local/bin:/usr/local/bin:$PATH
export PATH=$HOME/.cargo/bin:$PATH
# vars
export EDITOR='nvim'
export HISTSIZE=1000000
export SAVEHIST=1000000
export FZF_HISTORY_FILE="$HOME/.zsh_history"

###########
# PLUGINS #
###########
# zsh-git-prompt
source $HOME/.zsh/zsh-git-prompt/zshrc.sh
# color-man-pages
source $HOME/.zsh/colored-man-pages/colored-man-pages.plugin.zsh
# fzf
source <(fzf --zsh)

# managers
if command -v apt >/dev/null 2>&1; then # ubuntu
    source /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh 
    source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
fi
if command -v emerge >/dev/null 2>&1; then #gentoo
    source /usr/share/zsh/site-functions/zsh-autosuggestions.zsh
    source /usr/share/zsh/site-functions/zsh-syntax-highlighting.zsh
fi
if command -v pacman >/dev/null 2>&1; then #arch
    source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
    source /usr/share/zsh/plugins/zsh-autocomplete/zsh-autocomplete.plugin.zsh
    # Enable zsh-syntax-highlighting (must be last!)
    source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
fi

###########
# PROMPTS #
###########
current_hostname=$(hostname)
if [[ "$current_hostname" == "dslay" ]]; then
    host_color="red"
elif [[ "$current_hostname" == "worker" ]]; then
    host_color="cyan"
elif [[ "$current_hostname" == "edsik" ]]; then
    host_color="green"
else
    host_color="green"
fi

PROMPT='%n@%F{$host_color}%m%f %F{cyan}%~%f $(git_super_status) %# '

###########
# ALIASES #
###########

alias cat="bat --paging=never"
alias ls="eza -a --oneline --icons=always"
alias vim="nvim"
alias clock="tty-clock -cbD"
alias cal="cal -m3"
alias wu="wg-quick up wg0"
alias wd="wg-quick down wg0"
alias mkdir="mkdir -p"

##########
# LAUNCH #
##########
fastfetch
