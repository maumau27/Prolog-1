man(socrates).
man(plato).

mortal(X) :- man(X).

birth_year(socrates, -469).
birth_year(plato, -428).

taught(socrates, plato).
taught(plato, aristotle).
taught(aristotle, alexander_the_great).

taught_indirectly(T, T).
taught_indirectly(T, S) :- taught(T, X), taught_indirectly(X, S).

% For shorthand typing.
ti(X,Y) :- taught_indirectly(X,Y).



mortal(aristotle).
