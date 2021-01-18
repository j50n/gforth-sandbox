needs objects.fs
needs ../../term-util.f

object class
    selector draw  ( x y graphical -- )
end-class graphical

graphical class
    cell% field rect-x1
    cell% field rect-y1
    cell% field rect-x2
    cell% field rect-y2

    :noname  ( rect -- )
        rect-x1 @ rect-x2 @ at-xy ." $" ;
    overrides draw

    :noname  ( x1 y1 x2 y2 rect -- ) 
        rect-y2 !
        rect-x2 !
        rect-y1 !
        rect-x1 ! ;
    overrides construct
end-class rect