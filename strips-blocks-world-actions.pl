% Blocks World Action Descriptions.
% strips_rule(action(args), preconds, add-list, delete-list)

strips_rule(stack(X,Y),
	[clear(Y), holding(X)],
	[on(X,Y), clear(X), handempty],
	[clear(Y), holding(X)]).

strips_rule(unstack(X,Y),
	[on(X,Y), clear(X), handempty],
	[clear(Y), holding(X)],
	[on(X,Y), clear(X), handempty]).

strips_rule(pickup(X),
	[ontable(X), clear(X), handempty],
	[holding(X)],
	[ontable(X), clear(X), handempty]).

strips_rule(putdown(X),
	[holding(X)],
	[ontable(X), clear(X), handempty],
	[holding(X)]).


% A few problem queries.
% Easy: All blocks start on table and clear.
problem1 :-
  plan(
  [ontable(a),ontable(b),ontable(c),clear(a),clear(b),clear(c),handempty],
  [on(b,c), on(a,b)]).

% Medium: Must unstack before stacking.
problem2 :-
  plan(
  [on(a,c),ontable(b),ontable(c),clear(a),clear(b),handempty],
  [on(b,c), on(a,b)]).

% Sussman Anomaly.
% Harder: Subgoal interaction. 
problem3 :-
  plan(
    [on(c,a),ontable(a),ontable(b),clear(b),clear(c),handempty],
    [on(b,c), on(a,b)]).


