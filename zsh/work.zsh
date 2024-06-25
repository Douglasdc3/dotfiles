alias acc="ssh eu-acc-003 \"cd /var/www/\$(basename \$(pwd))/current && git rev-parse --abbrev-ref HEAD\""
alias prod="echo 'EU-PROD-006: ' && ssh eu-prod-006 \"cd /var/www/\$(basename \$(pwd))/current && git rev-parse --abbrev-ref HEAD\" && echo '\nEU-PROD-007: ' && ssh eu-prod-007 \"cd /var/www/\$(basename \$(pwd))/current && git rev-parse --abbrev-ref HEAD\""

alias dep-acc="vendor/bin/dep deploy eu-acc-003.ci-web.eu --branch=\$(git branch --show-current)"
alias dep-prod="vendor/bin/dep deploy eu-prod-006.ci-web.eu,eu-prod-007.ci-web.eu --branch=\$(git branch --show-current)"

alias acc-log="ssh eu-acc-003 \"tail -f /var/www/\$(basename \$(pwd))/shared/storage/logs/*.log\""

dcoxdebug () {
	local sed_command='s/^;xdebug.start_with_request=yes/xdebug.start_with_request=yes/'
	local sed_command_plugin='s/^;zend_extension=xdebug/zend_extension=xdebug/'
	if [[ $2 == 'disable' ]]
	then
		sed_command='s/^xdebug.start_with_request=yes/;xdebug.start_with_request=yes/'
		sed_command_plugin='s/^zend_extension=xdebug/;zend_extension=xdebug/'
	fi
	docker-compose exec $1 sed -i -e $sed_command -e $sed_command_plugin /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini && docker-compose restart $1 --timeout=0
}

