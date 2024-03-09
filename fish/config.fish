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
alias open 'xdg-open'
alias vi 'nvim'

ca
function fish_prompt
    set -l current_time (date "+%H:%M:%S")
    set_color cyan
    echo -n '┌──('

    # Check the hostname
    set -l host_name (hostname)
    
    # Set the appropriate symbol based on the hostname
    switch $host_name
        case 'kali'
            echo -n (whoami)  
            echo -n '㉿'
            echo -n $host_name
        case 'ROUISSA'
            echo -n (whoami)  
            echo -n ''
            echo -n $host_name
        case 'localhost'
            echo -n 'andr'
            echo -n ''
            echo -n 'oid'
        case '*'
            echo -n '󰨊'
            echo -n $host_name
    end

    set_color cyan
    echo -n ')-['
    set_color magenta
    echo -n (prompt_pwd)
    set_color cyan
    echo -n ']'

    # Check if we're in a Git repository
    if git rev-parse --is-inside-work-tree > /dev/null 2>&1
        set -l branch_name (git rev-parse --abbrev-ref HEAD)
        if test "$branch_name" != "HEAD"
            echo -n " ("
            set_color green
            echo -n $branch_name
            set_color cyan
            echo -n ")"
        end
    end

    echo ''
    echo -n '└─$ '
    set_color normal
end

