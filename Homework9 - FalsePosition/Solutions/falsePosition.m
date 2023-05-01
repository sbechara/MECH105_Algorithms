function [ root,fx,ea,iter ] = falsePosition( func,xl,xu,es,varargin )
%falsePosition Finds the root of a function using false position method
%
%   [root,fx,ea,iter] = falsePosition(func,xl,xu,es,p1*,p2*...)
%
%   User Hint: Plot the function before making initial guesses
%   Note: The function will only attempt 200 iterations at most.
%
% Inputs:
%   func - the function being evaluated
%   xl, xu - guesses, lower and upper
%   es - desired relative error (default = .0001%)
%   p1*,p2*... - additional parameters used by function
%
% Outputs:
%   root - real root
%   fx - function evaluated at root
%   ea - approximate relative error (%)
%   iter - the number of iterations performed

% User must at least give function and upper and lower guesses
if nargin < 3
    error('At least 3 arguments required')
end

% Var test checks if sign change detected
test = func(xl,varargin{:})*func(xu,varargin{:});

% If test > 0 --> no sign change, throw error
if test > 0
    error('No sign change over interval specified')
end

% Default Variable tests
if nargin < 4 || isempty(es)
    es = 0.0001;
end

% Check if user guessed root because students are obsessed with that
if func(xl,varargin{:}) == 0
    error('The lower limit you guessed was a root!');
elseif func(xu,varargin{:}) == 0
    error('The upper limit you guessed was a root!');
end
    

% Initialize variables
iter = 0; xr = xl; ea = 100; maxit = 200;

% While under max iterations or the error is too high
while ea >= es && iter < maxit
    xrold = xr;
    % if you don't include doubles below, it will destroy your memory...
    % including the double is essentially FORCING a round off error though
    xr = double(xu) - ((double(func(xu,varargin{:}))*double((xl-xu)))/(double(func(xl,varargin{:}))-double(func(xu,varargin{:}))));
    iter = iter + 1;
    
    % If the root is not at x = 0
    if xr ~= 0
        ea = abs((xr-xrold)/xr)*100;
    end
    
    % False position method, how to change bracket
    if sign(func(xr,varargin{:})) == sign(func(xl,varargin{:}))
        xl = xr;
    elseif sign(func(xr,varargin{:})) == sign(func(xu,varargin{:}))
        xu = xr;
    else
        ea = 0; % Saddle or root at 0 solution
    end
end

% Set output variables to doubles for prettyness
root = double(xr);
fx = double(func(xr, varargin{:}));
ea = double(ea);
iter = double(iter);
    

end

