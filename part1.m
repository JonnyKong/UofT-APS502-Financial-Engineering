% Objective coefficient (Take reciprocal to get maximum)
c1 = [20, 20 - 15, 100]';
c2 = [40, 40 - 15, 100]';
c3 = [12, 0, 100]';
c = -1 * (c1 + c2 + c3) / 3;

% Inequality constraints
A = [];
b = [];

% Equality constraints
Aeq = [20, 10, 90];
beq = [20000];

% Variable bounds
ub = [inf, 50, inf]';
lb = [0, 0, 0]';

% Call linprog from matlab
[x, fval] = linprog(c, A, b, Aeq, beq, lb, ub)