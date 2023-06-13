alias gpb='git push --set-upstream origin "$(g rev-parse --abbrev-ref HEAD)"' # Push branch to upstream
alias gcl='g branch | grep -v "master" | xargs g branch -d' # Clean deleted branches
alias co='git checkout'
alias develop='git checkout develop'
alias main='git checkout $([ `git rev-parse --quiet --verify master` ] && echo "master" || echo "main")' # Change to main branch
