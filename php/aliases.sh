alias test='vendor/bin/pest --stop-on-error --stop-on-failure'
alias cautoload='composer dump-autoload -o'
alias testdb='php artisan migrate:fresh --env=testing && php artisan db:seed --class=TestDatabaseSeeder --env=testing'
alias art='php artisan'
alias serve='art serve'
alias tinker='art tinker'
alias pest='vendor/bin/pest'
alias rollback='art migrate:rollback'
alias utest='vendor/bin/pest --stop-on-error --stop-on-failure tests/Unit'
alias cc='art cache:clear && art config:clear'
alias migrate='art migrate'
alias phpunit='vendor/bin/phpunit'
alias ftest='vendor/bin/pest --stop-on-error --stop-on-failure tests/Feature'

alias gclear="composer clear-generated-files"
alias gclient="composer create-client-files"
alias gserver="composer create-server-interface"

export PATH=$PATH:/usr/grpc/grpc/cmake/build:/usr/grpc/grpc/cmake/build/third_party/protobuf