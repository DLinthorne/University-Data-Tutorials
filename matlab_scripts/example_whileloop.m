%
% Author: Christopher Dydula
% Created: 10 June 2019
% Modified: 10 June 2019
%
% An example script demonstrating while loop syntax.
%

clc

% instatiate a variable c
x = 0;

% loop over the elements of a vector
while x < 5
    
    % do something in the while loop
    fprintf('x is still less than 5 (x == %d)\n' , x)
    
    % increment x
    x = x + 1;
    
end