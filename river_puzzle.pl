opp(w, e).
opp(e, w).

safe(state(FaFoCh, FaFoCh, FaFoCh, Co)).      
safe(state(FaChCo, Fo, FaChCo, FaChCo)).   
safe(state( _, Fo, Ch, Co)) :- opp(Fo, Ch), opp(Ch, Co).

move(state(Fa, Fo, Ch, Co), state(NFa, Fo, Ch, Co)) :- opp(Fa, NFa), safe(state(NFa, Fo, Ch, Co)).

move(state(FaFo, FaFo, Ch, Co), state(NFaFo, NFaFo, Ch, Co)) :- opp(FaFo, NFaFo), safe(state(NFaFo, NFaFo, Ch, Co)).

move(state(FaCh, Fo, FaCh, Co), state(NFaCh, Fo, NFaCh, Co)) :- opp(FaCh, NFaCh), safe(state(NFaCh, Fo, NFaCh, Co)).

move(state(FaCo, Fo,  Ch, FaCo), state(NFaCo, Fo, Ch, NFaCo)) :-opp(FaCo, NFaCo), safe(state(NFaCo, Fo, Ch, NFaCo)).

%step(A, B) :- move(A, B).

not_member(_, []). 
not_member(X, [Y|_]) :- X = Y, !, fail.
not_member(X, [_|Ys]) :- not_member(X, Ys).



reach(S, S, _, [S]).
reach(A, B, Visited, [A|Path]) :- move(A, C), not_member(C, Visited),  reach(C, B, [C|Visited], Path).

solve(Path) :- reach(state(w, w, w, w), state(e, e, e, e), [state(w,w,w,w)], Path).
