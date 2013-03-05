%jobs
sold(mrmason,poison).

%relationships
married(lorddunsmore,ladyemily).
married(gardner,maid).
rival(lorddunsmore,lordsecrest).
customer(inspector,mrmason).
daughter(misssecrest,lordsecrest).
customer(lordsecrest,mrmason).
suitor(professor,ladyemily).
debt(butler,lorddunsmore).

%hobbies
hobby(professor,philosopher).
hobby(ladyemily,music).
hobby(mrmason,philosophy).
hobby(lorddunsmore,tennis).
hobby(lordsecrest,philosophy).
hobby(gardener,music).

% X is friends with Y if X and Y share hobby Z
friends(X,Y):- hobby(X,Z),hobby(Y,Z).

% X has the ability to kill if X is a customer of Y who sold a weapon
weapon(X):- customer(X,Y),sold(Y,poison).

% X has access to a weapon if X is friends with Y who has a weapon
weaponaccess(X):- friends(X,Y),weapon(Y).
weaponaccess(X):- married(X,Y),weapon(Y).
weaponaccess(X):- married(Y,X),weapon(Y).
weaponaccess(X):- daughter(X,Y),weapon(Y).
weaponaccess(X):- daughter(Y,X),weapon(Y).
weaponaccess(X):- suitor(X,Y),weapon(Y).
weaponaccess(X):- suitor(Y,X),weapon(Y).


% X has motive to kill Y
motive(X,Y):- rival(Y,X),weapon(X).
motive(X,Y):- married(Y,X),weapon(Y).
motive(X,Y):- debt(X,Y),weapon(X).