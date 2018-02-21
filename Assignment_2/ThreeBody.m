function [dy] = ThreeBody(t,y)
global mM mE mS G
rS = [y(1);y(2)];
vS = [y(3);y(4)];
rM = [y(5);y(6)];
vM = [y(7);y(8)];
rE = [0;0];
vE = [0;0];

%Distances
dES = rS - rE; %Earth to SC
dEM = rM - rE; %Earth to Moon
dSM = rM - rS; %SC to Moon

%Forces
G_E_S = G*mE*mS/norm(dES)^2;
G_E_M = G*mE*mM/norm(dEM)^2;
G_S_M= G*mS*mM/norm(dSM)^2;

%Accelerations
aS = (G_S_M.*dSM./norm(dSM) - G_E_S.*dES./norm(dES))./mS;
aM = -(G_S_M.*dSM./norm(dSM) + G_E_M.*dEM./norm(dEM))./mM;

dy = [vS;aS;vM;aM];
end