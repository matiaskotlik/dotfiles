function gac --wraps='git add -A && git commit' --description 'alias gac git add -A && git commit'
  git add -A && git commit $argv
        
end
