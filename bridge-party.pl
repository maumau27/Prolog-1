
sol(Final):- Final=[[_,_,wine],[_,_,cookie],[_,_,coffee],[_,_,_]],
	     member([andrews,_,chocolate],Final),
	     member([brown,_,Bb],Final), Bb\==cookie,
	     member([_,vivien,Bv],Final),Bv\==cookie,
             member([clark,ann,Ba],Final), Ba\==cookie,
             member([_,mary,Bm],Final), Bm \== wine,
             member([davidson,_,_],Final), 
             member([X,rachel,coffee],Final), X \== davidson.
