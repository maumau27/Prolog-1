sold(mrmason,poison).

relationship(lorddunsmore,ladyemily).
relationship(gardner,maid).
relationship(lorddunsmore,lordsecrest).
relationship(inspector,mrmason).
relationship(misssecrest,lordsecrest).
relationship(lordsecrest,mrmason).
relationship(professor,ladyemily).
debt(butler,lorddunsmore).

hobby(professor,philosopher).
hobby(ladyemily,music).
hobby(mrmason,philosophy).
hobby(lorddunsmore,tennis).
hobby(lordsecrest,philosophy).
hobby(gardener,music).

relationship(X,Y):- hobby(X,Z),hobby(Y,Z).

isKiller(X,lorddunsmore):-
	