s" ./term-util.f" required
s" ./demos.f" required

variable paddlex

10 constant pw

: ddebug ( -- )
    0 0 at-xy
    form ." w=" . ." h=" . space 
    cr ." px=" paddlex @ . space ;

: draw-paddle ( -- )
    0 t-height 2 - at-xy term-erase-line
    \ paddlex @ 1 - t-height 2 - pw 2 + 32 hline 
    paddlex @ t-height 2 - pw 9608 hline ;

: ark
    page
    cursor-hide
    begin
        ddebug
        ekey? if
            ekey 
            dup 27 = if 
                cursor-show
                drop 
                exit
            else
                case 
                    k-left of 
                            paddlex @ 0 >  if 
                                -1 paddlex +!
                            then 
                        endof
                    k-right of 
                            paddlex @ t-width pw - < if
                                1 paddlex +!
                            then 
                        endof
                endcase 
                draw-paddle 
            then
        then
        8 ms
    again ;
