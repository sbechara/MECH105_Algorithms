function [ I ] = Simpson_Bechara( x,y )
%SimpsonBechara Numerical evaluation of integral by Simpson's 1/3 Rule
%(composite)
%   I = Simpson_Bechara(x,y)
% Inputs
%   x = the vector of equally spaced independent variable
%   y = the vector of function values with respect to x
% Outputs:
%   I = the numerical integral calculated

% Error check that the inputs are the same length
if length(x) ~= length(y)
    error('x and y are not the same length');
end

% Error check that the x input is equally spaced
dx = diff(x);
if max(dx)-min(dx) ~= 0     
    error('x is not equally spaced');
end

% Warn if trapezoidal rule is used on last interval
if mod(length(x),2) == 0
    disp('Odd number of intervals detected; Trapezoidal rule will be used for the last interval')
    n = length(x) - 1;
else
    n = length(x);
end

% Integration

h = dx(1);
y1 = y(2:2:n-1);
y2 = y(3:2:n-2);
I = (y(1) + 4*sum(y1) + 2*sum(y2) + y(n)) * h/3;

if n ~= length(x)
    I = I + (y(length(x)) + y(n)) * h/2;
end