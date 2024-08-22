alias d="docker"
alias dc="docker compose"
alias dce="docker compose exec"
dcea () {
    docker compose exec $(docker compose ps --services 2>/dev/null | grep -v '^event\|web-.*' | head -n1) $*
}
dceas () {
    docker compose exec app su app -c "$*"
}
alias dceasa="dceas php artisan"

