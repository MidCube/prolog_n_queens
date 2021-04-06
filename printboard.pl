% Little bit of messing around to pretty print the board with the Queen positions
printCells(_, []) :-
    !,
    write('|'),
    nl.
printCells(CurrentRow, [CurrentRow|Rest]) :-
    !,
    write('| Q '),
    printCells(CurrentRow, Rest).
printCells(CurrentRow, [_|Rest]) :-
    !,
    write('|   '),
    printCells(CurrentRow, Rest).
printSpacer(0) :-
    !,
    write(+),
    nl.
printSpacer(N) :-
    write(+---),
    M is N-1,
    printSpacer(M).
printRows(0, _, Size) :-
    !,
    printSpacer(Size).
printRows(N, Positions, Size) :-
    printSpacer(Size),
    printCells(N, Positions),
    M is N-1,
    printRows(M, Positions, Size).
len([], 0).
len([_|T], N) :-
    len(T, M),
    N is M+1.
printBoard(Positions) :-
    len(Positions, Len),
    printRows(Len, Positions, Len).