%{
ASEN - 4057 Assignment #1 - Problem 3 Quentin Moore

This function takes the radius, r, payload weight, Wp, and empty weigth,
Wb, of a balloon as well as the molecular weight, MW, of the gas inside and
calculates the total weight, Wt, assuming a spherical balloon. All units
are SI.
%}
function Wt = BalloonWeight(r,Wp,Wb,MW)
rho_0 = 1.225; %Density  of air at STP
Wgas = 4*pi*rho_0*r^3*MW/(3*28.996); %Weight of the gas
Wt = Wgas + Wp + Wb; %Total weight
end