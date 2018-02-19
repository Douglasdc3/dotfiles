alias gcd="git checkout development"
alias gcm="git checkout master"
alias gll="git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit --all"
alias gs="git status"

gpb()
{
    git push --set-upstream origin $(git rev-parse --abbrev-ref HEAD)
}

git-own()
{
    git ls-files | while read f; do git blame --line-porcelain $f | grep '^author '; done | sort -f | uniq -ic | sort -n
}

nah()
{
    git reset --hard;
    git clean -df;
}

gh-sync()
{
    git fetch upstream;
    git reset --hard upstream/master;
    git push --force;
}

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

