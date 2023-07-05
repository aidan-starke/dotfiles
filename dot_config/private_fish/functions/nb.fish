function nb --wraps='git checkout -b' --description 'alias nb=git checkout -b'
  git checkout -b $argv
        
end
