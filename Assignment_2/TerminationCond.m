function [value, isterminal,direction] = TerminationCond(t,y)
global success rE rM
isterminal = 1;
direction = 0;
value = 1;
pE = [0 0];
pS = y(1:2);
pM = y(5:6);
dEM = norm(pM);
if norm(pS-pE)<=rE
    value = 0;
    success = 3;
end
if norm(pS-pE)>= 2*dEM
    value = 0;
    success = 2; 
end
if norm(pS-pM)<=rM
    value = 0;
    success = 1;
end
end
