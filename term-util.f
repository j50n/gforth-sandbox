27 constant escape-key

\ Display the number without a trailing space.
: dot ( n1 -- )
    s>d 0 d.r ;

\ Emit the escape character.
: esc ( -- ) 
    escape-key emit ;

\ Hide the terminal cursor.
: cursor-hide ( -- )
    esc
    ." [?25l" ;

\ Show the terminal cursor.
: cursor-show ( -- )
    esc
    ." [?25h" ;

\ Draw a horizontal line of char ch from x,y with length len, draw direction right.
: hline ( n1 n1 n1 n1 -- ) { x y len ch }
    x y at-xy
    len 0 ?do
        ch xemit
    loop ;

\ Draw a vertical line of char ch from x,y with length len, draw direction down.
: vline ( n1 n1 n1 n1 -- ) { x y len ch }
    len 0 ?do
        x y i + at-xy
        ch xemit
    loop ;

\ Height of the terminal in characters.
: t-height ( -- n1 )
    form drop ;

\ Width of the terminal in characters.
: t-width ( -- n1 )
    form nip ;

: term-set-fg-color-8 ( n1 -- )
    esc
    ." [38;5;" 
    dot
    ." m" ;

: term-set-bg-color-8 ( n1 -- )
    esc
    ." [48;5;"
    dot
    ." m"  ;

\ 8-bit grayscale in 24 steps from black (0) to white (23).
: term-grayscale ( n1 -- n1 )
    dup 0 24 within IF
        232 +
    else 
        drop abort" grayscale must be 0..23 inclusive"
    then ;

0 constant term-color-black
1 constant term-color-red
2 constant term-color-green
3 constant term-color-yellow
4 constant term-color-blue
5 constant term-color-magenta
6 constant term-color-cyan
7 constant term-color-white

\ May be used to brighten any of `term-color-*` named colors.
: term-color-bright ( n1 -- n1 )
    8 + ;

\ Reset foreground and background colors to defaults.
: term-color-reset ( -- )
    esc ." [39m" esc ." [49m" ;

: term-reset ( -- )
    esc ." [0m" ;

: term-bold-on ( -- ) 
    esc ." [1m" ;

: term-bold-off ( -- )
    esc ." [21m" ;

: term-underline-on ( -- )
    esc ." [4m" ;

: term-underline-off ( -- )
    esc ." [24m" ;

: term-cursor-up-n ( n1 -- ) 
    esc ." [" dot ." A" ;

: term-cursor-down-n ( n1 -- ) 
    esc ." [" dot ." B" ;

: term-cursor-forward-n ( n1 -- ) 
    esc ." [" dot ." C" ;

: term-cursor-back-n ( n1 -- ) 
    esc ." [" dot ." D" ;

: term-scroll-up-n ( n1 -- ) 
    esc ." [" dot ." S" ;

: term-scroll-down-n ( n1 -- ) 
    esc ." [" dot ." T" ;

: term-erase-to-end-of-line ( -- ) 
    esc ." [K" ;

: term-erase-line ( -- ) 
    esc ." [2K" ;