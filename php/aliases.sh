alias cautoload='composer dump-autoload -o'
alias art='php artisan'
alias tinker='art tinker'
alias serve='art serve'
alias cc='art cache:clear && art config:clear'
alias migrate='art migrate'
alias rollback='art migrate:rollback'

alias phpunit="vendor/bin/phpunit"
alias test="vendor/bin/phpunit --stop-on-error --stop-on-failure"
alias ftest="vendor/bin/phpunit --stop-on-error --stop-on-failure tests/Feature"
alias utest="vendor/bin/phpunit --stop-on-error --stop-on-failure tests/Unit"
alias phpcs="vendor/bin/phpcs"
alias phpcsl="vendor/bin/phpcs --standard=phpcs.xml $(git diff master --name-only --diff-filter=)"