%This function takes the radius, payload weight, balloon weight and
%molecluar weight of interior gas of a balloon and calculates the maximum
%height of the balloon.
function hmax = MaxHeight(r,Wp,Wb,MW)
WB = BalloonWeight(r,Wp,Wb,MW);%Find balloon weight
h = 0;%Initial guess
WA = DisplacedWeight(r,h);

while WA > WB%Iterate until the max height is found
    h = h + 10;
    WA = DisplacedWeight(r,h);
end
hmax = h;
end