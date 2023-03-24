function fetch --wraps='git fetch --prune' --description 'alias fetch=git fetch --prune'
  git fetch --prune $argv
        
end
