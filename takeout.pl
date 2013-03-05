% takeout.pl	% Includes perm (permutations).
% takeout(Element, List, ResultList).
% When E is taken out of [E|R], R results.
% When E is taken out of the tail of [H|T], [H|S] results,
% where S is the result of taking E out of T.

takeout(E,[E|R],R).
takeout(E,[H|T],[H|S]) :- takeout(E,T,S).

perm([],[]).
perm([X|Y],P) :- perm(Y,W), takeout(X,P,W).   
