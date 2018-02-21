clear all
close all
clc
%% Setting up the Model
profile on
%Setting up initial conditions as global variables:
global mM mE mS rM rE G success Y0
mM = 7.34767309*10^22; %kg (Mass of the Moon)
mE = 5.97219*10^24; %kg (Mass of the Earth)
mS = 28833; %kg (Mass of the Space Craft)
rM = 1737100; %m (Radius of the Moon)
rE = 6371000; %m (Radius of the Earth)
G = 6.674*10^(-11); %N(m/kg)^2
success = 0;

%Setting up initial velocities and positions:
dES(1) = 338000000; %m (Distance From Earth to the Space Craft)
ThetaS = 50*pi/180; %Radians (Angle of the Space Craft)
vS(1) = 1000; %m/s (Velocity of the Space Craft)
xS(1) = dES(1)*cos(ThetaS); %m  (Horizontal Position of the Space Craft)
yS(1) = dES(1)*sin(ThetaS); %m  (Vertical Position of the Space Craft)
vSX(1) = vS(1)*cos(ThetaS); %m  (Horizontal Velocity of the Space Craft)
vSY(1) = vS(1)*sin(ThetaS); %m  (Vertical Velocity of the Space Craft)

dEM(1) = 384403000; %m (Distance From the Earth to the Moon)
ThetaM = 42.5*pi/180; %Radians (Angle of the Moon)
vM(1) = sqrt((G*mE^2)/((mE+mM)*dEM(1))); %m/s (Velocity of the Moon)
xM(1) = dEM(1)*cos(ThetaM); %m  (Horizontal Position of the Moon)
yM(1) = dEM(1)*sin(ThetaM); %m  (Vertical Position of the Moon)
vMX(1) = -vM(1)*sin(ThetaM); %m  (Horizontal Velocity of the Moon)
vMY(1) = vM(1)*cos(ThetaM); %m  (Vertical Velocity of the Moon)
Y0 = [xS(1),yS(1),vSX(1),vSY(1),xM(1),yM(1),vMX(1),vMY(1)]; %Vector of Initial Conditions

th0 = .5; th1 = 2.5; v0 = 70; v1 = 100;
%[th_c1 v_c1] = OptV(0,2*pi,0,100,10,50,1.1,0);
%[th_c2 v_c2] = OptV(0,2*pi,0,100,20,20,1.3,0);
[th_ct v_ct tmin] = OptTime(th0,th1,v0,v1,8,40,2,0);
[th_cv v_cv] = OptV(th0,th1,v0,v1,8,40,2,0);


%[th_c4 v_c4] = OptV(0,2*pi,0,100,10,50,1.1,0;

%% Trajectory Plot
vx = v_cv*cos(th_cv); vy = v_cv*sin(th_cv);
y0 = Y0 + [0 0 vx vy 0 0 0 0];
options = odeset('Events',@TerminationCond,'RelTol',1e-8);
[t_v,y_v] = ode45(@(t,y)ThreeBody(t,y),[0,1e7],y0,options);

vx = v_ct*cos(th_ct); vy = v_ct*sin(th_ct);
y0 = Y0 + [0 0 vx vy 0 0 0 0];
[t_t,y_t] = ode45(@(t,y)ThreeBody(t,y),[0,1e7],y0,options);

%Earth
th = linspace(0,2*pi,1e3);
xE = rE.*cos(th); yE = rE.*sin(th);
xM = rM.*cos(th); yM = rM.*sin(th);

figure(1),
plot(xE,yE,'b','LineWidth',2);hold on
plot(y_v(:,1),y_v(:,2),'Color',[0.5 0.8 0]);
plot(y_t(:,1),y_t(:,2),'Color',[0.3 0 1]);
plot(y_v(:,5),y_v(:,6),'r--');
plot(y_v(end,5)+xM,y_v(end,6)+yM,'r','LineWidth',2);hold off
legend('Earth','Optimized \Delta V','Optimized Time','Moon Trajectory')
xlabel('x (m)');ylabel('y (m)'); title('Apollo 13 Trajectory')

profile viewer

    