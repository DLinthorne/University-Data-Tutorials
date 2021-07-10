%
% Author: Christopher Dydula
% Created: 10 June 2019
% Modified: 10 June 2019
%
% An example script with conditional statements.
%

clear
clc

a = 0;
b = 3;

if a
    disp('Condition 1 is True')
else
    disp('Condition 1 is False')
end

if ~a
    disp('Condition 2 is True')
else
    disp('Condition 2 is False')
end

if a && b
    disp('Condition 3 is True')
else
    disp('Condition 3 is False')
end

if a || b
    disp('Condition 4 is True')
else
    disp('Condition 4 is False')
end

