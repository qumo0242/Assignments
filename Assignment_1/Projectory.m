%{
ASEN - 4057 
Assignment #1 - Problem #1 
Quentin Moore

This script prompts the user for an initial angle above horizontal and
initial airspeed of a projectile and then plots the trajectory of that
projectile assuming no drag and constant gravitational acceleration of 9.81
m/s^2
%}

g = 9.81; %Gravitatoinal Acceleration
th = input('Please specify launch angle in degrees\n');
V = input('Please specify launch speed in m/s\n');
T = 2*V*sind(th)/g; %Solve for time of impact

t = linspace(0,T,1e4); 
x = V*cosd(th).*t; % Horizontal Location
y = -.5*g.*t.^2 + V*sind(th).*t; % Vertical Location

%Plot
figure
plot(x,y)
xlabel('Horizontal Distance (m)')
ylabel('Vertical Distance (m)')
