

# GIT STUFF
alias gs 'git status'
alias ga 'git add'
alias ga. 'git add .'
alias gaa 'git add --all'

alias gb 'git branch'
alias gcm 'git commit -m '
alias gcma 'git commit --all'
alias gsw 'git switch'
alias g- 'git switch -'
alias gco 'git checkout'
alias gc 'git checkout'
alias gpl 'git pull'
alias gpu 'git push'
# alias gpu '[[ -z $(git config "branch.$(git symbolic-ref --short HEAD).merge") ]] && git push -u origin $(git symbolic-ref --short HEAD) || git push'

alias gpuf 'git push -f'
alias gm 'git merge'


alias gst 'git stash'
alias gstp 'git stash pop'
alias gsta 'git stash apply'

alias ga 'git add -A'
alias gap 'git add -p'
alias guns 'git unstage'
alias gunc 'git uncommit'

alias gm 'git merge'
alias gms 'git merge --squash'
alias gam 'git amend --reset-author'
alias grv 'git remote -v'
alias grr 'git remote rm'
alias grad 'git remote add'

# Log
alias gl 'git log'
alias glog 'git log --graph --pretty --abbrev-commit --date=relative --branches'

# Rebasing
alias gr 'git rebase'
alias grdev 'git rebase develop'
alias gra 'git rebase --abort'
alias grc 'git rebase --continue'
alias gri 'git rebase --interactive'
alias grs 'git rebase --skip'

# Fetch
alias gf 'git fetch'
alias gfp 'git fetch --prune'
alias gfa 'git fetch --all'
alias gfap 'git fetch --all --prune'
alias gfch 'git fetch'

alias gd 'git diff'

# Undoing
alias undopush 'git push -f origin HEAD^:master' # Undo a `git push`
alias undocommit 'git reset HEAD~1'
alias undocommitforce 'git reset --hard HEAD~1'


