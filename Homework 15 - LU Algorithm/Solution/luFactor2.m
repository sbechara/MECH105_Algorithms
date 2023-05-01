function [L, U, P] = luFactor2(A)
% luFactor(A)
%	LU decomposition with pivotiing
% inputs:
%	A = coefficient matrix
% outputs:
%	L = lower triangular matrix
%	U = upper triangular matrix
%   P = the permutation matrix

[m,n]=size(A);
if m~=n
    error('Matrix A must be square');
end

L = eye(n);
P = L;
U = A;

for k = 1:n-1
    
    if k == 1
        columnCheck = abs(U(k:end,k));
    else
        columnCheck = [zeros(k-1,1); abs(U(k:end,k))];
    end
    
    columnCheck = abs(U(k:end,k));
    
    [~,Index] = max(columnCheck); % ~ instead of dummy var
    
    %If the largest value isn't at the top, pivot
    if Index ~= k
        U = swap(U,k,Index);
        P = swap(P,k,Index);
    end
    
    % Forward Elimination
    for i = k+1:n
        factor = U(i,k)/U(k,k);
        U(i,k) = 0;
        U(i,k+1:n) = U(i,k+1:n)-factor*U(k,k+1:n);
    end
end
L = (P*A)/U; % Kind of a cheat? Worry about L at the end!
end

function [Anew] = swap(A,rowNum,maxIndex)
% A local function that performs the row swap operation. Makes code much more
% readable and saves time. Local functions are only accessible by the
% function they are inside.

Anew = A;
Anew(rowNum,:)=A(maxIndex,:); % move the largest value of A in col to top
Anew(maxIndex,:)=A(rowNum,:); % replace pivoted row with the old top row
end