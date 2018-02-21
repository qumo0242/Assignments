function [t, y, cond] = odeNOT45(f,y0,t0,tol)
global rM rE
go = 1; %Termination Condition
i = 1; %Iteration
t(i) = t0;
y(i,:) = y0;
h = tol;
%The Butcher Tableau
c = [0 .25 3/8 12/13 1 1/2];
a = [0 0 0 0 0 0;.25 0 0 0 0 0;3/32 9/32 0 0 0 0;...
    1932/2197 -7200/2197 7296/2197 0 0 0;439/216 -8 3680/513 -845/4104 0 0;...
    -8/27 2 -3544/2565 1859/4104 -11/40 0];
b = [16/135 0 6656/12825 28561/56430 -9/50 2/55;...
    25/216 0 1408/2565 2197/4204 -1/5 0];

while go
    ti = t(i);
    yi = y(i,:);
    %The ks
    k1 = f(ti,yi)';
    k2 = f(ti + c(2)*h,yi + h*a(2,1).*k1)';
    k3 = f(ti + c(3)*h,yi + h.*(a(3,1).*k1 + a(3,2).*k2))';
    k4 = f(ti + c(4)*h, yi + h.*(a(4,1).*k1 + a(4,2).*k2 + a(4,3).*k3))';
    k5 = f(ti + c(5)*h, yi + h.*(a(5,1).*k1 + a(5,2).*k2 + a(5,3).*k3 + a(5,4).*k4))'; 
    
    y5 = yi + h.*(b(1,1).*k1 + b(1,2).*k2 + b(1,3).*k3 + b(1,4).*k4 + b(1,5).*k5);
    y4 = yi + h.*(b(2,1).*k1 + b(2,2).*k2 + b(2,3).*k3 + b(2,4).*k4);
    error = abs(y5 - y4);
    
    if max(error) > tol
       h = 0.9*h*tol/max(error);
    else
        y(i+1,:) = y5;
        t(i+1) = ti + h;

        % Check Termination Conditions
        rSC = y(i+1,1:2);
        rMoon = y(i+1,5:6);
        rEarth = [0 0];
        %Termination Condition #1
        if norm(rSC - rMoon)<= rM
            go = 0;
            cond = 1;
        end
        %Termination Condition #2
        if norm(rSC - rEarth) <= rE
            go = 0;
            cond = 2;
        end
        %Termination Condition #3
        if norm(rSC - rEarth) >= 2.*norm(rEarth - rMoon)
            go = 0;
            cond = 3;
        end
        i = i+1;
        if max(error)/tol < 1e-3
            h = 1.1*h;
        end
    end
end
end
    