if status is-interactive
    # Commands to run in interactive sessions can go here
end

set -U fish_greeting ""
set -U EDITOR nvim

alias ls 'ls --color=auto'
alias la 'ls -a'
alias ll 'ls -l'
alias lla 'ls -la'
alias grep 'grep --color=auto'
alias ca 'clear'
alias checkcnx 'ping -c 5 8.8.8.8'
alias open 'xdg-open'
alias vi 'nvim'
starship init fish | source

ca

