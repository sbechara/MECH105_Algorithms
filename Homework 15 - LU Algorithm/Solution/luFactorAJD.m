function [L, U, P] = luFactorAJD(A)
% *************************************************************************
% luFactorAJD: computes LU factorization with partial pivoting
% by Aryeh Drager, March 2018, for MECH 105 @ Colorado State University
% *************************************************************************
% Input:
% A: matrix to be factored
% *************************************************************************
% Outputs:
% L: lower triangular matrix
% U: upper triangular matrix
% P: pivot matrix
% *************************************************************************

% Check for nonsensical inputs:
if nargin ~= 1
    error('Need exactly one input.')
end

if ~isnumeric(A)
    error('Input matrix A must be numeric.')
end

if ~ismatrix(A)
    error('Input matrix A must be two-dimensional.')
end

if size(A,1) ~= size(A,2)
    error('Input matrix A must be a square matrix.')
end

% Record the size of A:
size_A = size(A,1);

% Initialize L, U, and P:
L = eye(size_A);
U = A;
P = eye(size_A);

for iter = 1:(size_A-1)
    % Pivoting: examine the last several rows of the pivot column
    column_to_examine = U(iter:size_A,iter);
    % Find the location of the maximum value in the pivot column
    % (within the last several rows):
    [~,max_loc] = max(abs(column_to_examine));
    % If the maximum is not in the top row, swap rows within U and P, and
    % swap entries of L as appropriate:
    if max_loc ~= 1
        
        max_loc = max_loc + iter - 1;
        top_row_loc = iter;
        
        U = rowSwap(U,max_loc,top_row_loc);
        P = rowSwap(P,max_loc,top_row_loc);
        
        if iter > 1
            L_left_bound_swap = 1;
            L_right_bound_swap = iter - 1;
            
            L = partialRowSwap(L,max_loc,top_row_loc,...
                L_left_bound_swap,L_right_bound_swap);
        end
    end
    % Perform Gauss elimination:
    for row_num = (iter+1):size_A
        mult_factor = U(row_num,iter)./U(iter,iter);
        L(row_num,iter) = mult_factor;
        U(row_num,:) = U(row_num,:) - mult_factor.*U(iter,:);
    end
    
end

end

function A_swapped = rowSwap(A_orig,row1,row2)
% *************************************************************************
% rowSwap: swaps two rows of a matrix
% by Aryeh Drager, March 2018, for MECH 105 @ Colorado State University
% *************************************************************************
% Inputs:
% A_orig: original matrix
% row1, row 2: indices of the rows of A_orig to swap (e.g., 1 and 3 to swap
% first and third rows)
% *************************************************************************
% Output:
% A_swapped: new matrix with swapped rows
% *************************************************************************

row1_orig = A_orig(row1,:);
row2_orig = A_orig(row2,:);

A_swapped = A_orig;

A_swapped(row2,:) = row1_orig;
A_swapped(row1,:) = row2_orig;

end

function A_swapped = partialRowSwap(A_orig,row1,row2,left_bound,right_bound)
% *************************************************************************
% partialRowSwap: swaps two partial rows of a matrix
% by Aryeh Drager, March 2018, for MECH 105 @ Colorado State University
% *************************************************************************
% Inputs:
% A_orig: original matrix
% row1, row 2: indices of the rows of A_orig to swap (e.g., 1 and 3 to swap
% first and third rows)
% left_bound, right_bound: indices of the left and right bounds of the
% "chunk" of the matrix whose rows to swap
% *************************************************************************
% Output:
% A_swapped: new matrix with partially swapped rows
% *************************************************************************

row1_orig = A_orig(row1,left_bound:right_bound);
row2_orig = A_orig(row2,left_bound:right_bound);

A_swapped = A_orig;

A_swapped(row2,left_bound:right_bound) = row1_orig;
A_swapped(row1,left_bound:right_bound) = row2_orig;

end



