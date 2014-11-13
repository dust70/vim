" Vim compiler file
" Compiler: PHPUnit

if exists("current_compiler")
    finish
endif
let current_compiler = "phpunit_local"

if executable("./bin/phpunit")
    CompilerSet makeprg=./bin/phpunit\ --strict\ --verbose
else
    CompilerSet makeprg=phpunit\ --strict\ --verbose
endif
CompilerSet errorformat=%E%n)\ %.%#,%Z%f:%l,%C%m,%C,%-G%.%#
