%{
ASEN - 4057 
Assignment #1 - Problem 2 
Quentin Moore

This function takes in two vectors x and y representing the independent and
dependent data of some measurement respectively and calculates the slope,
m, and the y intercept, b, of the best fit line of that data
%}
function [m,b] = BestFit(x,y)
%Comput Summed values
A = sum(x);
B = sum(y);
C = sum(x.*y);
D = sum(x.^2);
N = length(x);

%Compute m and b
m = (A*B - N*C)/(A^2 - N*D);
b = (A*C - B*D)/(A^2 - N*D);
end