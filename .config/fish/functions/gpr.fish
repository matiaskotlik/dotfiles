function gpr --wraps='git pull --rebase' --description 'alias gpr git pull --rebase'
  git pull --rebase $argv
        
end
