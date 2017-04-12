alias gcd="git checkout development"
alias gcm="git checkout master"
alias gpb="git push --set-upstream origin $(git rev-parse --abbrev-ref HEAD)"

composer-bump()
{
    echo "Press any key to continue, Vim will start and auto bump the patch version. Press space :q to quit vim in orde to commit & push your changes..."
    read

    vim -c "/ver" -c ":normal \$2h" -c ":call feedkeys(\"\<C-A>\")" -c "w" composer.json
    VERSION=$(cat composer.json  | grep version | head -1 | awk -F: '{ print $2}' | sed 's/[",]//g' | tr -d '[[:space:]]')
    MESSAGE="[BUMP] $VERSION"
    VERSION_STRING="v$VERSION"

    echo $VERSION_STRING
    git add composer.json
    git commit -m "$MESSAGE"
    git tag $VERSION_STRING

    git push
    git push --tag
}

