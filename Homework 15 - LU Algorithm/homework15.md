# MECH 105: Homework 15
# LU Factorization (with Partial Pivoting) Algorithm Development

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

## LU Factorization Algorithm
Develop a MATLAB function that determines the LU Factorization of a square matrix. Your algorithm must use partial pivoting. You must name the function `luFactor` to recieve credit.

For full credit, you must include appropriate error checking. If you are confused about what would be appropriate or have questions, feel free to come to office hours!

Inputs:
* A - coefficient matrix

Outputs:
* L - lower triangular matrix
* U - upper triangular matrix
* P - the pivot matrix

### **FOR TESTING PURPOSES ONLY**
Perform LU Factorization on the following system of equations
$10x_1+2x_2-x_3=27$
$-3x_1-6x_2+2x_3=-61.5$
$x_1+x_2+5x_3=-21.5$
Then, multiply the resulting `[L]` and `[U]` matrices to determine that `[A]` is produced.
