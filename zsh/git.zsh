alias gcd=git checkout development
alias gcm=git checkout master


composer-bump()
{
    VERSION=$(cat composer.json | grep version | head -1 | awk -F: '{ print $2}' | sed 's/[",]//g' | tr -d '[[:space:]]')
    MESSAGE="[BUMP] $VERSION"
    VERSION_STRING="v$VERSION"

    echo $VERSION_STRING
    git commit -m "$MESSAGE"
    git tag $VERSION_STRING

    git push
    git push --tag
}
