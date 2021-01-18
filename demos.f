s" ./term-util.f" required

\ Do nothing until the escape key is pressed.
: wait-for-escape ( -- )
    begin 
        key
    escape-key = until ;

: EKEYPLAY
    BEGIN
        EKEY? IF 
            EKEY 
            DUP 27 = IF 
                DROP EXIT
            ELSE
                . SPACE
            THEN
        ELSE
            16 MS
        THEN
    AGAIN ;

\ Draws a box around the edges of the terminal. Useless, but proves I can
\ do this with invisible cursor and without auto-scrolling.
: box-border ( -- )
    cursor-hide
    
    term-color-green term-color-bright term-set-fg-color-8
    12 term-grayscale term-set-bg-color-8

    0 0 t-width [char] @ hline                   ( line at top )
    0 t-height 1 - t-width [char] @ hline     ( line at bottom )
    0 0 t-height [char] @ vline                  ( line at left )
    t-width 1 - 0 t-height [char] @ vline     ( line at right )

    term-color-reset

    wait-for-escape
    cursor-show ;

: block-char-codes ( -- ) 
    9631 9600 do
        cr i . ." - " i xemit
    loop ;

: emoji-char-codes ( -- ) 
    $1F610 $1F600 do
        cr i . ." - " i xemit ." @"
    loop 
    cr
    $1F610 $1F600 do
        i xemit
    loop ;