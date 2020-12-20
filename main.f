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

27 constant escape-key

\ Do nothing until the escape key is pressed.
: wait-for-escape ( -- )
    begin 
        key
    escape-key = until ;

\ Hide the terminal cursor.
: hide-cursor ( -- )
    27 emit
    ." [?25l" ;

\ Show the terminal cursor.
: show-cursor ( -- )
    27 emit
    ." [?25h" ;

\ Draw a horizontal line of char ch from x,y with length len, draw direction right.
: hline ( n1 n1 n1 n1 -- ) { x y len ch }
    x y at-xy
    len 0 ?do
        ch emit
    loop ;

\ Draw a vertical line of char ch from x,y with length len, draw direction down.
: vline ( n1 n1 n1 n1 -- ) { x y len ch }
    len 0 ?do
        x y i + at-xy
        ch emit
    loop ;

\ Height of the terminal in characters.
: term-height ( -- n1 )
    form drop ;

\ Width of the terminal in characters.
: term-width ( -- n1 )
    form nip ;

\ Draws a box around the edges of the terminal. Useless, but proves I can
\ do this with invisible cursor and without auto-scrolling.
: box-border ( -- )
    hide-cursor
    0 0 term-width [char] @ hline                   ( line at top )
    0 term-height 1 - term-width [char] @ hline     ( line at bottom )
    0 0 term-height [char] @ vline                  ( line at left )
    term-width 1 - 0 term-height [char] @ vline     ( line at right )
    wait-for-escape
    show-cursor ;