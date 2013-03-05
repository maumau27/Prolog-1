% Prolog Dynamic Planner

% Show initial state after consulting file: a on b on c on table.
% ?- listing(on).
%
% Run the planner to reverse the tower of blocks.
% ?- do([on(a,table), on(b,a), on(c,b)]). -- c on b on a on table
%
% Show resulting state.
% ?- listing(on).
%
% Show plan.
% ?- listing(move).

:- dynamic on/2.

% Initial State.
on(a,b).
on(b,c).
on(c,table).

put_on(A,B) :-
     A \== table,
     A \== B,
     on(A,X),
     clear(A),
     clear(B),
     retract(on(A,X)),
     assert(on(A,B)),
     assert(move(A,X,B)).

clear(table).
clear(B) :-
     not(on(_X,B)).

r_put_on(A,B) :-
     on(A,B).
r_put_on(A,B) :-
     not(on(A,B)),
     A \== table,
     A \== B,
     clear_off(A),
     clear_off(B),
     on(A,X),
     retract(on(A,X)),
     assert(on(A,B)),
     assert(move(A,X,B)).

clear_off(table).
clear_off(A) :-
     not(on(_X,A)).
clear_off(A) :-
     A \== table,
     on(X,A),
     clear_off(X),
     retract(on(X,A)),
     assert(on(X,table)),
     assert(move(X,A,table)).


do(Glist) :-
      valid(Glist),
      do_all(Glist,Glist).

valid(_).

do_all([G|R],Allgoals) :-          /* already true now */
     call(G),
     do_all(R,Allgoals),!.         /* continue with rest of goals */

do_all([G|_],Allgoals) :-          /* must do work to achieve */
     achieve(G),
     do_all(Allgoals,Allgoals).    /* go back and check previous goals */
do_all([],_Allgoals).              /* finished */

achieve(on(A,B)) :-
     r_put_on(A,B).

