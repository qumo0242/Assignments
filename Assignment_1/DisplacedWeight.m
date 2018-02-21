%{
ASEN - 4057 Assignment #1 - Problem 3 Quentin Moore

This function takes the radius, r, and altitude , h, of a balloon and
calculates the weight of the displaced air, Wair, assuming the balloon is a
sphere. All units are SI.
%}
function Wair = DisplacedWeight(r,h)
%First calculate ambien Temperature and Pressure
%They are a piecewise function of altitude
if  h <= 11000
    T = 5.04 - 0.00649*h;
    P = 101.29*exp(((T + 273.15)/288.08)^5.256);
elseif h > 21500
    T = -131.21 + .00299*h;
    P = 2.488*((T + 273.15)/216.6)^-11.388;
else
    T = -56.46;
    P = 22.65*exp(1.73 - .000157*h);
end
rho = P/(.2869*(T + 273.15));%Caculate ambient air density
Wair = 4*pi*rho*r^3/3;%Calculate the weight of air
end
   