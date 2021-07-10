%
% Author: Christopher Dydula
% Created: 10 June 2019
% Modified: 10 June 2019
%
% An example script.
%

% housekeeping
clear
clc

% create two 3x3 matrices 
A = [2 1 1; 1 3 5; 3 2 2];
B = [5 2 4; 3 3 2; 7 6 2];

% compute product of A and B
C = A * B;

% display the determinant of C in a formatted string
fprintf('The determinant of AB is %.2f\n', det(C))