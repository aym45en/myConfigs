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
alias chatgpt 'chromium --app=https://chat.openai.com'
alias github 'chromium --app=https://https://github.com/aym45en45.com'
alias gtranslate 'chromium --app=https://translate.google.com'
starship init fish | source

ca
cd ~/Desktop/

