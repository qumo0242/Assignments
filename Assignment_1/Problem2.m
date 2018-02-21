%{
ASEN - 4057 
Assignment #1 - Problem 2 
Quentin Moore

This script uses the function BestFit to plot the coefficient of lift over
angle of attack data from an F-117 Nighthawk with a line of best fit
%}
%Test Data
alpha = [-5 -2 0 2 3 5 7 9 14];
Cl = [-.008 -.003 .001 .005 .007 .006 .009 .0145 .019];
%Get Least-Squares
[m b] = BestFit(alpha,Cl)
%Plot
figure
plot(alpha, Cl,'*',[-6 16],[b-6*m b+16*m]);
xlabel('\alpha (\circ)')
ylabel('C_l')
legend('Data','Least Squares Line')