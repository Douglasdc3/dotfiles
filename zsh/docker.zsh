alias d="docker"
alias dc="docker-compose"
alias dce="docker-compose exec"
alias dcea="docker-compose exec app"
dceas () {
    docker-compose exec app su app -c "$*"
}
alias dceasa="dceas php artisan"

