%% Logistic Iteration
% This is a script to show Logistic iteration.
% 
% Creation date: 2018-12-31
% 
% Last modification date: 2019-01-02
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

iterN = 100; % number of iteration
r0 = 2.5; % begining of r
rt = 4.0; % end of r
h = 0.01; % interval of r

r = r0 : h : rt; % create r array
N = length(r); % number of r

x0 = 0.5 * ones(1, N); % begining of x array

fprintf('Initialization complete.\n')
%% Iteration
%%

fprintf('Iterating...\n')

x = zeros(2 * iterN, N); % x array
y = zeros(2 * iterN, N); % y array

x(1, :) = x0;
y(1, :) = x0;
x(2, :) = x0;
y(2, :) = f(r, x0);

for i = 2 : iterN
    % iteration
    x(2 * i - 1, :) = y(2 * i - 2, :);
    y(2 * i - 1, :) = y(2 * i - 2, :);
    x(2 * i, :) = y(2 * i - 2, :);
    y(2 * i, :) = f(r, y(2 * i - 2, :));
end

t1 = clock; % end time
fprintf('Iteration complete.\n')
fprintf('Runging time = %g s.\n', etime(t1, t0))
%% Movie
%%

fprintf('Preparing for movie...\n')

xx = (0 : 0.01 : 1)';

for i = 1 : N
    cla;
    hold on
    axis([0, 1, 0, 1])
    plot(xx, xx, '-b', 'LineWidth', 0.7) % plot y = x
    plot(xx, f(r(i), xx), '-r', 'LineWidth', 0.7) % plot y = f(r, x)
    plot(x(:, i), y(:, i), '-', 'LineWidth', 0.7) % plot iteration lines
    
    title(['Logistic Iteration, r = ', num2str(r(i), '%.2f')])
    xlabel('x')
    ylabel('y')
    hold off
    F(i) = getframe(gcf);
end

fprintf('Preparation for movie complete.\n')
fprintf('Playing movie...\n')

axes('Position', [0 0 1 1])
movie(F, -1, 60)

fprintf('Playing movie complete.\n')