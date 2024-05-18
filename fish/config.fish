if status is-interactive

  set -U fish_greeting ""
  set -U EDITOR nvim

  alias ls 'ls --color=auto'
  alias la 'ls -a'
  alias ll 'ls -l'
  alias lla 'ls -la'
  alias lt 'ls -lt'
  alias lta 'ls -lta'
  alias lS 'ls -lS'
  alias lsa 'ls -lSa'
  alias grep 'grep --color=auto'
  alias ca 'clear'
  alias open 'xdg-open'
  alias vi 'nvim'
  alias .2 'cd ../..'
  alias .3 'cd ../../..'
  alias .4 'cd ../../../..'
  alias ipShow 'curl ipinfo.io/ip'

  ca
   
  if test (uname -n) = 'localhost'
    neofetch
    alias passkey "gpg -d ~/univ-info/.p/p.pdf"
    function pull_all_repos
      set -l repos ~/univ-info/s4/ \
                   ~/univ-info/.p \
                   ~/univ-info/.myconfigs \
                   ~/myNovel/ibada 
      for repo in $repos
          echo "Pulling changes in $repo..."
          cd $repo
          set_color blue
          echo -e "\n ------------------------------------"
          set repoPath (echo $repo | cut -d '/' -f 7-)
          echo -e " ####### ~/$repoPath ####### \n"
          set_color white
          git status
          git pull
      end
      cd
    end
  else
    alias passkey "gpg -d ~/.p/p.pdf"
    function pull_all_repos
      set -l repos ~/Desktop/s4/ \
                   ~/.p \
                   ~/.myConfigs \
                   ~/ibada 
      for repo in $repos
          echo "Pulling changes in $repo..."
          cd $repo
          set_color blue
          echo -e "\n ------------------------------------"
          set repoPath (echo $repo | cut -d '/' -f 4-)
          echo -e " ####### ~/$repoPath ####### \n"
          set_color white
          git status
          git pull
      end
      cd
    end
  end

  function fish_prompt
      set -l current_time (date "+%d/%m/%Y-%H:%M:%S")
      echo -en "\n$current_time 󱑔 "
      # Convert milliseconds to minutes and seconds for command execution time
      set -l cmd_minutes (math "round($CMD_DURATION / 60000)")
      set -l cmd_seconds (math "round($CMD_DURATION % 60000 / 1000)")

      # Display command execution time in the format "0 m 15 s"
      echo -n "$cmd_minutes:$cmd_seconds 󰅒"
      echo ''

      set_color cyan
      echo -n '┌──('

      # Check the hostname
      set -l host_name (uname -n)
      set -l username (whoami)

      if [ $host_name = 'localhost' ]
        echo -n ' 󰬽 󰬾 '
      else
        if [ $username = 'root' ]
          set_color red
          echo -n (whoami)
        else
          echo -n (whoami)
        end
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
      if [ $username = 'root' ]
        echo -n '└─# '
      else
        echo -n '└─$ '
      end
      set_color normal
  end
end
