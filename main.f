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