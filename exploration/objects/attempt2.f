\ objects.fs does some funky stuff with CATCH that looks correct but
\ displays scary warnings during compile. Let's turn off warnings, temporarily.
warnings 0 warnings !
needs objects.fs
warnings !

object class 
    selector debug-display  ( textual -- )
end-class textual%

textual% class
    cell% field _number_

    :noname  { n1 'numeric -- }
        ." constructed something" cr
        n1 'numeric _number_ ! ;
    overrides construct

    :noname  ( numeric -- ) 
        ." The number is " _number_ @ . ;
    overrides debug-display

end-class numeric%

50 numeric% heap-new constant my-numeric-instance

cr
my-numeric-instance debug-display
cr
