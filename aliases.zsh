# Better ls
alias ls='eza --icons'

# Detailed listing
alias ll='eza -lh --icons --git'

# Detailed listing including hidden files
alias la='eza -lah --icons --git'

# Tree view
alias tree='eza --tree --icons'

# Reuse ls completions for eza (avoids defining a separate completion function)
compdef eza=ls

# Better cat
#alias cat='bat'

# =========================================================
# Core utilities
# =========================================================

alias grep='rg --color=auto'
alias diff='diff --color=auto'
alias df='df -h'

# =========================================================
# Navigation
# =========================================================

alias -- -='cd -'  # -- prevents - being parsed as a flag; cd - jumps to previous directory

lf() { # zsh follow lf navigation
    tmp=$(mktemp)
    command lf -last-dir-path="$tmp" "$@"
    if [ -f "$tmp" ]; then
        dir=$(cat "$tmp")
        rm -f "$tmp"
        [ -d "$dir" ] && [ "$dir" != "$(pwd)" ] && cd "$dir"
    fi
}

# =========================================================
# Editor
# =========================================================

alias vim='nvim'

# =========================================================
# Git
# =========================================================

alias glog='PAGER="less -F -X" git log'                              # -F quit if one screen, -X no clear on exit
alias gadog='PAGER="less -F -X" git log --all --decorate --oneline --graph'
alias dotfiles='git --git-dir=$HOME/.dotfiles --work-tree=$HOME'

# =========================================================
# Video
# =========================================================

#alias stream='mpv av://v4l2:/dev/video4 --fullscreen --demuxer-lavf-o=input_format=mjpeg,framerate=30 --profile=low-latency --untimed'

# terraform
#alias tp='terraform plan'
#alias ta='terrafomr apply'

# kubectl
#alias k='kubectl'
#source /etc/bash_completion
#source <(kubectl completion bash)
#complete -o default -F __start_kubectl k

#alias kgp='kubectl get pods'
#alias kc='kubectx'
#alias kn='kubens'

#alias kcs='kubectl config user-context admin@homelab-staging'
#alias kcp='kbecrtl config use-context admin@homelab-production'

# =========================================================
# Containers
# =========================================================

alias rd='toolbox enter rancher'
alias rancher='toolbox run -c rancher rancher-desktop'
alias dc='toolbox run -c rancher nerdctl'
alias k='toolbox run -c rancher kubectl'
# kubectl
alias k='toolbox run -c rancher kubectl'
#source /etc/bash_completion
#source <(kubectl completion bash)
#complete -o default -F __start_kubectl k

alias kgp='toolbox run -c rancher kubectl get pods'
alias kc='toolbox run -c rancher kubectx'
alias kn='toolbox run -c rancher kubens'
alias kgn='toolbox run -c rancher kubectl get namespaces'
alias kcn='toolbox run -c rancher kubectl create namespace'
alias k9s='toolbox run -c rancher k9s'
