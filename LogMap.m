%% Logistic Map
% This is a script to produce Logistic map.
% 
% Creation date: 2018-12-31
% 
% Last modification date: 2018-12-31
% 
% By Bill Chen
%% Parameter initialization
%%

clear; % clear workspace
close all; % close all figures
clc; % clear command window

fprintf('Initializing...\n');

t0 = clock; % initial time

f = @(r, x) r .* x .* (1 - x); % iteration function

r0 = 2.5; % begining of r
rt = 4; % end of r
h = 0.0001; % interval of r

r = (r0 : h : rt)'; % create r array
N = length(r); % number of r

iter0 = 10000; % number of pre-iteration
itert = 10010; % end of iteration

iterN = itert - iter0; % number of iteration to be listed

fprintf('Initialization complete.\n')
%% Iteration
%%

fprintf('Iterating...\n')

x = zeros(iterN * N, 1); % x array
y = zeros(iterN * N, 1); % y array

temp = rand(N, 1); % randomized version of initial temp array
% temp = 0.5 * ones(N, 1); % nonrandomized version of initial temp array

for i = 0 : itert
    temp = f(r, temp); % iteration
    
    if i > iter0 % if i > iter0, update x, y arrays
        x((i - iter0 - 1) * N + 1 : (i - iter0) * N) = r;
        y((i - iter0 - 1) * N + 1 : (i - iter0) * N) = temp;
    end
end

t1 = clock; % end time
fprintf('Iteration complete.\n')
fprintf('Runging time = %g s.\n', etime(t1, t0))
%% Plot
%%

plot(x, y, '.', 'MarkerSize', 2)
title('Logistic Map')
xlabel('r')
ylabel('x_n')