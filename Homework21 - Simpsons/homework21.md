# MECH 105: Homework 21

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

## Part 1
Write a general MATLAB function for integrating experimental data using Simpson's 1/3 rule. Your function should check if there are an odd number of intervals, if there are, the trapezoidal rule should be used for the last interval.
The first line of your MATLAB function should look like:
```MATLAB
function I = Simpson(x,y)
```
Where the function numerically evaluates the integral of the vector of function values 'y' with respect to 'x'

Your matlab function should also include the following:
* Error check that the inputs are the same length
* Error check that the x input is equally spaced 
* Warn the user (not an error, just a warning) if the trapezoidal rule has to be used on the last interval.

## Part 2 - FOR TESTING PURPOSES ONLY, DO NOT TURN IN
Two important quantities when studying fermentation are the carbon dioxide evolution rate (g/h) and the oxygen uptake rate (g/h). These are calculated from expiremental analysis of the inlet and exit gases of the fermentor, and the flow rates, temperature, and pressure of these gases.

Using your function in part 1, and the data table below, calculate the total amount of carbon dioxide produced and oxygen consumed during fermentation. Compare to the value that the MATLAB function `trapz()` computes.

| Time of Fermentation (h) | Carbon Dioxide Evolution Rate (g/h) | Oxygen Uptake Rate (g/h) |
|:--------------------:|:-----------------------------:|:------------------:|
| 140 | 15.72 | 15.49 |
| 141 | 15.53 | 16.16 |
| 142 | 15.19 | 15.35 |
| 143 | 16.56 | 15.13 |
| 144 | 16.21 | 14.20 |
| 145 | 17.39 | 14.23 |
| 146 | 17.36 | 14.29 |
| 147 | 17.42 | 12.74 |
| 148 | 17.60 | 14.74 |
| 149 | 17.75 | 13.68 |
