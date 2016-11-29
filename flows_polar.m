function For_ode = flows(~, From_ode)
%Defining Constants
g = 9.81;   %Acceleration due to gravity (m/s/s)
l = 4;      %Length of pendulum (m)
m = 80;     %Mass of trapeze artist (Kg)

%Unpacking Matrix from Ode
a = From_ode(1)
l = From_ode(2);
dadt = From_ode(3);
dldt = From_ode(4);

%Calculating accelerations
ddadtt = (-(g/l)*sin(a)); %Acceleration of Angle
ddldtt = 0; %Acceleration of length

%Packaginng for ode
For_ode = [dadt; dldt; ddadtt; ddldtt];
end