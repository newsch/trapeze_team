function For_ode = flows(~, From_ode)
% Defining Parameters
g = 9.81;   % Accel due to gravity(m/s)
l = 4;      % Length of pendulum (m)
m = 80;     % Mass of person (Kg)


% Unpacking Matrix from Ode
x = From_ode(1);
y = From_ode(2);
Vx = From_ode(3);
Vy = From_ode(4);

Rmag = sqrt( x^2 + y^2 );

%Calculating forces
Ft = m*g*y/Rmag; % Total force of tension 

% Calculating accelerations
dVxdt = Ft * (x / Rmag) / m; % Horizontal Portion of tension force
dVydt = -g + Ft * (y / Rmag) / m; % Vertical Portion of tension force

%Useless Renaming
dXdt = Vx;
dYdt = Vy;

%Packaginng for ode
For_ode = [dXdt; dYdt; dVxdt; dVydt];
end