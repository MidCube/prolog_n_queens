:- [perm].
:- [printboard].
:- use_module(library(bounds)).

eightQueens(L) :-
    nQueens(8,L).

nQueens(N, L) :-
        generate_list(N,T),
        perm(T,L),
        safe_queens(L).

generate_list(0, []).
generate_list(N, [N|T]) :-
    M is N-1,
    generate_list(M, T).



safe_queens([]).
safe_queens([Q|Qs]) :- safe_queens(Qs, Q, 1), safe_queens(Qs).

safe_queens([], _, _).
safe_queens([Q|Qs], Q0, D0) :-
        Q0 #\= Q,
        abs(Q0 - Q) #\= D0,
        D1 #= D0 + 1,
        safe_queens(Qs, Q0, D1).

checkDiagonals([A,B,C,D,E,F,G,H]):- B=\=A+1,
    B=\=A-1,
    C=\=B+1,
    C=\=B-1,
    C=\=A+2,
    C=\=A-2,
    D=\=C+1,
    D=\=C-1,
    D=\=B+2,
    D=\=B-2,
    D=\=A+3,
    D=\=A-3,
    E=\=D+1,
    E=\=D-1,
    E=\=C+2,
    E=\=C-2,
    E=\=B+3,
    E=\=B-3,
    E=\=A+4,
    E=\=A-4,
    F=\=E+1,
    F=\=E-1,
    F=\=D+2,
    F=\=D-2,
    F=\=C+3,
    F=\=C-3,
    F=\=B+4,
    F=\=B-4,
    F=\=A+5,
    F=\=A-5,
    G=\=F+1,
    G=\=F-1,
    G=\=E+2,
    G=\=E-2,
    G=\=D+3,
    G=\=D-3,
    G=\=C+4,
    G=\=C-4,
    G=\=B+5,
    G=\=B-5,
    G=\=A+6,
    G=\=A-6,
    H=\=G+1,
    H=\=G-1,
    H=\=F+2,
    H=\=F-2,
    H=\=E+3,
    H=\=E-3,
    H=\=D+4,
    H=\=D-4,
    H=\=C+5,
    H=\=C-5,
    H=\=B+6,
    H=\=B-6,
    H=\=A+7,
    H=\=A-7.

:- eightQueens(L),
   printBoard(L).

