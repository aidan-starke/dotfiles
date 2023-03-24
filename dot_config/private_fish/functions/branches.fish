function branches --wraps='git branch -a' --description 'alias branches=git branch -a'
  git branch -a $argv
        
end
