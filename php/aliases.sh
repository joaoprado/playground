alias test='vendor/bin/pest --stop-on-error --stop-on-failure'
alias cautoload='composer dump-autoload -o'
alias testdb='php artisan migrate:fresh --env=testing && php artisan db:seed --class=TestDatabaseSeeder --env=testing'
alias art='php artisan'
alias serve='art serve'
alias tinker='art tinker'
alias pest='vendor/bin/pest'
alias rollback='art migrate:rollback'
alias cc='art cache:clear && art config:clear'
alias migrate='art migrate'
alias phpunit='vendor/bin/phpunit'
alias ftest='vendor/bin/pest --stop-on-error --stop-on-failure tests/Feature'

alias gclear="composer clear-generated-files"
alias gclient="composer create-client-files"
alias gserver="composer create-server-interface"

alias artisan='php artisan'
alias bob='php artisan bob::build'

# Development
alias pas='php artisan serve'

# Database
alias pam='php artisan migrate'
alias pamf='php artisan migrate:fresh'
alias pamfs='php artisan migrate:fresh --seed'
alias pamr='php artisan migrate:rollback'
alias pads='php artisan db:seed'

# Makers
alias pamm='php artisan make:model'
alias pamc='php artisan make:controller'
alias pams='php artisan make:seeder'
alias pamt='php artisan make:test'
alias pamfa='php artisan make:factory'
alias pamp='php artisan make:policy'
alias pame='php artisan make:event'
alias pamj='php artisan make:job'
alias paml='php artisan make:listener'
alias pamn='php artisan make:notification'
alias pampp='php artisan make:provider'


# Clears
alias pacac='php artisan cache:clear'
alias pacoc='php artisan config:clear'
alias pavic='php artisan view:clear'
alias paroc='php artisan route:clear'

# queues
alias paqf='php artisan queue:failed'
alias paqft='php artisan queue:failed-table'
alias paql='php artisan queue:listen'
alias paqr='php artisan queue:retry'
alias paqt='php artisan queue:table'
alias paqw='php artisan queue:work'