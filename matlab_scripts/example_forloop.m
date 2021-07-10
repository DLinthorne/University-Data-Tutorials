%
% Author: Christopher Dydula
% Created: 10 June 2019
% Modified: 10 June 2019
%
% An example script demonstrating for loop syntax.
%

clc

% create a vector
v = [2.4, 5.6, 3, 3.543];

% loop over the elements of a vector
for k = 1:10
    
    % compute the square of each element
    sq = k^2;
    
    % print the result to the command window
    fprintf('The square of %f is %f\n', k, sq)
    
end