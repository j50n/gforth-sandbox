struct 
    cell% field placedef-fgcolor
    cell% field placedef-bgcolor
    cell% field placedef-icon    ( xchar of place icon )
    char% field placedef-alticon ( char of alternative place icon )
    cell% field placedef-speed
end-struct placedef%

: placedef-init  { W: fg W: bg W: icon C: alticon W: speed W: pd -- } 
    fg pd placedef-fgcolor !
    bg pd placedef-bgcolor !
    icon pd placedef-icon !
    alticon pd placedef-alticon c!
    speed pd placedef-speed ! ;

: placedef-print { W: pd -- }
    pd placedef-fgcolor @ .
    pd placedef-bgcolor @ .
    pd placedef-icon @ xemit space
    pd placedef-alticon c@ emit space
    pd placedef-speed @ . ;
