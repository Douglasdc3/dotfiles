alias gpb='git push --set-upstream origin "$(g rev-parse --abbrev-ref HEAD)"' # Push branch to upstream
alias gcl='g branch | grep -v "master" | xargs g branch -d' # Clean deleted branches
