%% Part a: 
% Calculate expected returns of the portfolio
r_1 = 0.161576319453774;
r_2 = -0.016142707038591;
r_3 = -0.083850395954210;

% Calculate stddev and cov of the portfolio
std_1 = 9.436465492538190;
std_2 = 0.470579874738465;
std_3 = 3.563572312667640;
cov_12 = 1.354063990681560;
cov_13 = 6.147032932019340;
cov_23 = -0.262925558879088;

%% Part b: Generate an efficient frontier between three assets
% Create portfolio
m = [std_1, std_2, std_3]';
C = [std_1^2, cov_12, cov_13;
    cov_12, std_2^2, cov_23;
    cov_13, cov_23, std_3^2];
p = Portfolio('assetmean', m, 'assetcovar', C, 'budget', 1, 'lb', 0);
plotFrontier(p);

% Estimate portfolio under specific profits
pwgt = estimateFrontierByReturn(p, [1 : 9]);
prsk = estimatePortRisk(p, pwgt);
% Produce table
fprintf('Portfolio and risk under different return goal:\n');
tbl = [pwgt', prsk]


%% Part c: Pick a portfolio and try it on January 2017
% Calculate realized return of each portfolio
r_realized_1 = 1.039291504403617;
r_realized_2 = 1.002798835772569;
r_realized_3 = 1.019317943695971;
r_realized = [r_realized_1, r_realized_2, r_realized_3];
fprintf('The realized individual return of three assets:\n');
fprintf('\tSPT:\t%f\n', r_realized(1));
fprintf('\tGOVT:\t%f\n', r_realized(2));
fprintf('\tEEMV:\t%f\n', r_realized(3));

% Pick a portfolio (#5)
port = pwgt(:, 5);
profit = r_realized * port;
fprintf('Choose the following Portfolio:\n');
fprintf('\tSPT:\t%f\n', port(1));
fprintf('\tGOVT:\t%f\n', port(2));
fprintf('\tEEMV:\t%f\n', port(3));
fprintf('The portfolio have profit %f\n', profit);