% jobs
sold(mrmason,poison).

% relationships
% X is married to Y
married(lorddunsmore,ladyemily).
married(gardner,maid).

% X is a rival of Y
rival(lorddunsmore,lordsecrest).

% X is a daughter of Y
daughter(misssecrest,lordsecrest).

% X is a customer of Y
customer(inspector,mrmason).
customer(lordsecrest,mrmason).

% X is a suitor of Y
suitor(professor,ladyemily).

% X is in debt to Y
debt(butler,lorddunsmore).

% X has hobby Y
hobby(professor,philosopher).
hobby(ladyemily,music).
hobby(mrmason,philosophy).
hobby(lorddunsmore,tennis).
hobby(lordsecrest,philosophy).
hobby(gardener,music).

% X is friends with Y if X and Y share hobby Z
friends(X,Y):- hobby(X,Z),hobby(Y,Z).
relations(X,Y):- married(X,Y).
relations(X,Y):- married(Y,X).
relations(X,Y):- daughter(X,Y).
relations(X,Y):- daughter(Y,X).
relations(X,Y):- suitor(X,Y).
relations(X,Y):- suitor(Y,X).

% X has the ability to kill if X is a customer of Y who sold a weapon
weapon(X):- customer(X,Y),sold(Y,poison).
weapon(X):- friends(X,Y),customer(Y,Z),sold(Z,poison).
weapon(X):- married(X,Y),customer(Y,Z),sold(Z,poison).
weapon(X):- daughter(X,Y),customer(Y,Z),sold(Z,poison).
weapon(X):- suitor(X,Y),customer(Y,Z),sold(Z,poison).

% X has access to a weapon if X is friends with Y who has a weapon
means(X):- weapon(X).

% X has motive to kill Y
motive(X,Y):- rival(X,Y).
motive(X,Y):- rival(Y,X).
motive(X,Y):- relations(X,Y).
motive(X,Y):- relations(Y,X).
motive(X,Y):- debt(X,Y).
motive(X,Y):- debt(Y,X).


% X killed Y if they have motive
killed(X,Y):- motive(X,Y), means(X).