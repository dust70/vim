if exists("b:current_syntax")
    " load the dictionary according to syntax
    let &dictionary=substitute(expand("$VIMRUNTIME/dict/FT.dict"), "FT", b:current_syntax, "")
endif
