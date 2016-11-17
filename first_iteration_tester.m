% FIRST_ITERATION_TESTER  plots animation of swinging pendulum

init_values = [-1, -1, 0, 0]; % position, in meters
time_limits = [0 5]; % in seconds

flow_handle = ; % handle for flow function
% events_handle = ; % handle for events function

[times, output] = ode45(flow_handle, time_limits, init_values);

X = output(:,1);
Y = output(:,2);
comet(X,Y);