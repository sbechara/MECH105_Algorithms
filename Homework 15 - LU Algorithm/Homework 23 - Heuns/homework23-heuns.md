# MECH 105: Homework 23 - Heuns Method with Iteration

## Rules / Suggestions
The following rules apply to ALL of our Algorithm Development Problems. These are helpful when you are testing your function and we will grade you on them.
1. You must use the correct function name.
2. Check number of function inputs and outputs (vector and scalar inputs)
3. Clear variables in workspace prior to running tests
4. If variable names are not given, use appropriate and consistent names
5. Check function for all possible number of inputs (use nargin during development to catch errors)
6. Run algorithm for at least 2 different input values
7. Check algorithm does not produce extraneous output
8. Comment code for readability

## Instructions
Write a general MATLAB function for solving differential equations using Heun's Method with iteration.
The first line of your MATLAB function should look like:
```MATLAB
function [t,y] = Heun(dydt,tspan,y0,h,es,maxit)
```
Where the function finds the numerical solution to the differential equation `dydt`, over the span `tspan`, with an initial condition `y0`, and step size `h`. The variables `es` and `maxit` should be optional and default to 0.001 and 50 if a user does not specify values for those inputs. `es` and `maxit` refer to the stopping criterion and maximum number of iterations, respectively, *for iterations involving the predictor-corrector*.

Your matlab function should also include the following:
* An ability to function if `tspan` is a little out of whack with `h`. For example, the program should work correctly if a user says `tspan = [0 2.1]` and `h = 0.2` without throwing an error.
* When run the function should display a plot of the `t` and `y` variables.
* The input `dydt` should work when the user inputs the differential equation as an anonymous function. Do not worry about symbolic equations!
