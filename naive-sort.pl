% Naive sort is not very efficient algorithm. It generates all
% permutations and then it tests if the permutation is a sorted list.

naive_sort(List,Sorted):-perm(List,Sorted),is_sorted(Sorted).
   
is_sorted([]).
is_sorted([_]).
is_sorted([X,Y|T]):- X=<Y, is_sorted([Y|T]).
