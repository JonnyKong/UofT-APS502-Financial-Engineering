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
p = Portfolio('assetmean', m, 'assetcovar', C);