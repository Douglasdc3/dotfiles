a () {
  if [ -f docker-compose.yml ]; then
    dcea php artisan $*
  else
    php artisan $*
  fi
}
alias art="a"
alias tinker="a tinker"
alias serve="php artisan serve"
alias mfs="a migrate:fresh --seed"

phpunit () {
  if [ -f docker-compose.yml ]; then
    dcea vendor/bin/phpunit $*
  else
    vendor/bin/phpunit $*
  fi
}
alias pf="p --filter "
alias pt="a test"
alias pp="a test --parallel"

c () {
  if [ -f docker-compose.yml ]; then
    dcea composer $*
  else
    composer $*
  fi
}
alias ci="c install"
alias cu="c update"
alias cud="c update -W"

