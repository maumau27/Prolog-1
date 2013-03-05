% One of many ways to reverse a list. Uses a temp accumulating var.
% reverse(L,Temp,R): List, Temp, Result.

reverse2(L,R) :- reverse(L,[],R).

reverse([],Temp,Temp). 
reverse([H|T],Temp,R) :- reverse(T,[H|Temp],R).