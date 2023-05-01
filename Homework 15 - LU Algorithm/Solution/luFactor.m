function [L, U, P] = luFactor(A)
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
    
    [~,Index] = max(columnCheck);
    
    % If the largest value isn't at the top, pivot
    if Index ~= k
        
        % Temp values coorespond to rows that are being pivoted down
        % This bit of code here is a good candidate for ANOTHER function
        % that swaps rows... see luFactor2.m for local function example
        tempU1 = U(k,:);
        tempP1 = P(k,:);
        
        U(k,:)=U(Index,:); % move the largest value of U in col to top
        U(Index,:)=tempU1; % replace pivoted row with the old top row
        
        P(k,:)=P(Index,:); % Same as above for pivot row.
        P(Index,:)=tempP1;
       
    end
    
    % Forward Elimination
	for i = k+1:n
		factor = U(i,k)/U(k,k);
		U(i,k) = 0;
		U(i,k+1:n) = U(i,k+1:n)-factor*U(k,k+1:n);
    end
    L = (P*A)/U; % Kind of a cheat? Worry about L at the end!
end
