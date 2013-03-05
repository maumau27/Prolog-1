% insert(Element, OriginalList, ResultList) is satisfied when
% ResultList is equal to OriginalList with Element added immediately
% before the first item which is greater than or equal to Element.  
insert(E, [], [E]).
insert(E, [H|T], [E,H|T]) :- E =< H.
insert(E, [H|T], [H|Z]) :- E > H, insert(E, T, Z).

% Perform sorting by insertion sort.
sorted([], []).
sorted([H|T], R) :- sorted(T, T1), insert(H, T1, R).
