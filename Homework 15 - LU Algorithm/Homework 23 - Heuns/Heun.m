function [t,y] = Heun(dydt,tspan,y0,h,es,maxit)
% [t,y] = Heun(dydt,tspan,y0,h): uses the heun method to integrate an ODE
% inputs:
%   dydt = the differential equation of interest (must be anonymous
%       function)
%   tspan = [ti,tf] the initial and final values of the independent
%       variable
%   y0 = the initial value of the dependent variable
%   h = step size
%   es = stopping criterion (%), optional (default = 0.001)
%   maxit = maximum iterations of corrector, optional (default = 50)
% outputs:iter = 0;
%   t = vector of independent variable values
%   y = vector of solution for dependent variable

% if necessary assign default values
if nargin < 6
    maxit = 50;
end
if nargin < 5
    es = 0.001;
end

% Create arrary to analayze values
ti = tspan(1);
tf = tspan(2);
t = (ti:h:tf)';
n = length(t);

% if necessary, add an additional value of t so that the range goes from
% t = ti to tf
if t(n) < tf
    t(n+1) = tf;
    n = n + 1;
end

% Initialize values for loop
y = y0*ones(n,1); % Preallocate for SPPPEEEEEEDDDDDDDDD

for i = 1:n-1
    
    hh = t(i+1) - t(i); % mostly for the additional value case
    m1 = dydt(t(i),y(i)); % USER MUST INPUT FUNCTION HANDLE
    y(i+1) = y(i) + m1*hh;
    
    % set variables here so that they clear for each time through predictor
    % corrector cycle
    iter = 0;
    ea = 100;
    
    % Begin predictor-corrector cycle. NOTE: I found an online solution that does this
    % incorrectly. Check to make sure this occurs for ITERATIONS, not for the above values.
    while ea >= es && iter <= maxit
        yold = y(i+1);
        m2 = dydt(t(i)+hh,y(i+1));
        y(i+1) = y(i) + (m1+m2)/2*hh;
        iter = iter + 1;

        if y(i+1) ~= 0 % POSSIBLE BUG, TA's CAN YOU THINK OF BETTER WAY?
            ea = abs((y(i+1) - yold)/y(i+1)) * 100;
        end

    end
end

plot(t,y)
