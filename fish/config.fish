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

  ca
   
  if test (uname -n) = 'localhost'
    cd ~/storage/shared/
    neofetch
    alias githubt "gpg -d ~/storage/shared/univ-info/.p/p.pdf | head -n 28 | tail -n 1"
    alias passkey "gpg -d ~/storage/shared/univ-info/.p/p.pdf | head -n 30 | tail -n 1"
    function pull_all_repos
      set -l repos ./univ-info/s4/s4 \
                   ./univ-info/s4/daw \
                   ./univ-info/.p \
                   ./univ-info/.myconfigs \
                   ./myNovel/ibada 
      echo "Do you want to perform a git pull for all repositories? (y/N)"
      read -l confirm
      if test "$confirm" = "y" -o "$confirm" = "Y"
          for repo in $repos
              echo "Pulling changes in $repo..."
              cd $repo
              git pull
              cd ~/storage/shared/
          end
              cd ~/storage/shared/univ-info/
      else
          echo "Skipping git pull for all repositories."
      end
    end
  else
    alias githubt "gpg -d ~/.p/p.pdf | head -n 28 | tail -n 1"
    alias passkey "gpg -d ~/.p/p.pdf | head -n 30 | tail -n 1"
  end


  function fish_prompt
      set -l current_time (date "+%H:%M:%S")
      echo -n "$current_time 󱑔 "
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
      echo -n '└─$ '
      set_color normal
  end
  pull_all_repos
end
