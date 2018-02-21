%{
This function searches for the quickest journey home.

INPUTS
    th0: is the lower bound on the angle in radians
    th1: is the upper bound on the angle in radians
    v0: is the lower bound on the speed in m/s
    v1:  is the upperbound on the speed in m/s
    res: is the number of partitions taken between th0 and th1 and v0 and
        v1 at each iteration
    iter: is the number of iterations
    rescale: is the window rescale factor at each iteration
    ifplot: is a boolean that evaluates as true if plots of the
        optimization are desired.
%}
function [th_c,v_c,Timemin] = OptTime(th0,th1,v0,v1,res,iter,rescale,ifplot)
global Y0 success
for i = 1:iter
    thi = 1;
    for th = th0:(th1-th0)/res:th1
        T(thi)=th;
        vi = 1;
        for v = v0:(v1-v0)/res:v1
            vx = v*cos(th); vy = v*sin(th);
            y0 = Y0 + [0 0 vx vy 0 0 0 0];
            options = odeset('Events',@TerminationCond,'RelTol',1e-8);
            [t,y] = ode45(@(t,y)ThreeBody(t,y),[0,1e7],y0,options);
            V(vi)= v; S(vi,thi)=success;
            Time(vi,thi) = t(end);
            vi = vi+1;
        end
        thi = thi+1;
    end  
    I = [];
    [I(:,1) I(:,2)] = find(S==3);
    for j = 1:length(I)
         SuccessTime(i)=Time(I(i,1),I(i,2));
    end
     
    tmin = min(SuccessTime);
    Index = find(SuccessTime == mean(tmin));
   
    
    v_c = mean(V(I(Index,1)));
    th_c = mean(T(I(Index,2)));
    th0 = th_c - (th1 - th0)/(2*rescale); th1 = 2*th_c - th0;
    v0 = v_c - (v1 - v0)/(2*rescale); v1 = 2*v_c - v0;
    if v1 > 100
        v1 = 100;
    end
    if ifplot
        figure(i)
        subplot(1,2,1)
        contourf(T,V,S,[1,2,3]);hold on
        plot(th_c,v_c,'xm',[th0 th0 th1 th1 th0],[v0 v1 v1 v0 v0],'m',...
            'LineWidth',2.5); hold off
        xlabel('\theta (rad)'); ylabel('V (m/s)');
        set(gca,'FontSize',13)
        
        subplot(1,2,2)
        contourf(T,V,Time);hold on
        c = colorbar;
        c.Label.String = 'Time (s)';
        plot(th_c,v_c,'xm',[th0 th0 th1 th1 th0],[v0 v1 v1 v0 v0],'m',...
            'LineWidth',2.5); hold off
        xlabel('\theta (rad)');
        set(gca,'FontSize',13)
    end
end
if ifplot
    figure(iter+1)
    plot([1:iter],Vc)
end
end