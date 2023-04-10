function gprp --wraps='git pull --rebase && git push' --description 'alias gprp git pull --rebase && git push'
  git pull --rebase && git push $argv
        
end
