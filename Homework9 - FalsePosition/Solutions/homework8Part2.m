% Homework 8 - Part 2

format long

% setup constants
g = 9.81;
mu = 0.55;
F = 150;
m = 25;

syms f(theta);
f(theta) = ((mu*m*g)/(cos(theta)+mu*sin(theta))) - F;

% THINK, what makes sense for angle? -pi/2 to pi/2. Everything else would
% be insane...
fplot(@(theta) f(theta),'r')
xlim([-pi/2 pi/2])
hold on
refline(0,0)
xticks([-pi/2:pi/8:pi/2])
xticklabels({'-\pi/2','-3\pi/8','-\pi/4','-\pi/8','0','\pi/8','\pi/4','3\pi/8','\pi/2'})

% After plotting there are two roots from -pi/2 to pi/2
% I would say it makes more sense for a positive angle when dragging a
% box...so only need to calculate root that is positive
% my first guess is between pi/4 and pi/2

% bisection variables have _b appended for ease
[root_b,fx_b,ea_b,iter_b] = bisect(@(theta) f(theta), 0.7, 1.5);
angle = rad2deg(root_b);
fprintf('\nBisection method results\n ');
fprintf('---------------------------\n');
fprintf('root: %f degrees\n', angle);
fprintf('f(%f): %f\n', angle,fx_b);
fprintf('Approximate Error: %f\n', ea_b);
fprintf('Number of iterations: %i\n\n',iter_b);

% false position variables have _f appended
[root_f,fx_f,ea_f,iter_f] = falsePosition(@(theta) f(theta), 0.7, 1.5);
angle_f = rad2deg(root_f);
fprintf('False Position method results\n ');
fprintf('---------------------------\n');
fprintf('root: %f degrees\n', angle_f);
fprintf('f(%f): %f\n', angle_f,fx_f);
fprintf('Approximate Error: %f\n', ea_f);
fprintf('Number of iterations: %i\n',iter_f);
