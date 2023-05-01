% script to test speed and efficacy of algorithm

clear
clc

pause

% test a bunch of different systems of equaitons
%A = [2 -6 -1; -3 -1 7; -8 1 -2];
%A = [3 -2 1; 2 6 -4; -8 -2 5];
%A = [1 2 3; 2 -4 6; 3 -9 3];
A = [2 1 1 0; 4 3 3 1; 8 7 9 5; 6 7 9 8];

tic
[l1,u1,p1]=lu(A);
toc

pause

tic
[l2,u2,p2]=luFactor(A);
toc

pause

tic
[l3,u3,p3]=luFactor2(A); 
toc

% Make sure same as built-in MATLAB function lu
l1l2_Test = l1 == l2
l2l3_Test = l1 == l3

u1u2_Test = u1 == u2
u1u3_Test = u1 == u3 

p1p2_Test = p1 == p2
p1p3_Test = p1 == p3