" Vim compiler file
" Compiler: PHPUnit

if exists("current_compiler")
    finish
endif
let current_compiler = "phpunit_local"

CompilerSet makeprg=php\ -d\ "error_reporting=E_ALL|E_STRICT"\ ./bin/phpunit\ --strict\ --verbose
"CompilerSet errorformat=%E%n)\ %.%#,%Z%f:%l,%C%m,%C,%-G%.%#
