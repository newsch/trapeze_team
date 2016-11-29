% FIRST_ITERATION_RUNNER  animates the first iteration

init_values = [-1, -1, 0, 0]; % position, in meters
time_limits = [0 5]; % in seconds

options = odeset('Events', @trapeze_event);
[first_times, first_output] = ode45(@flows, time_limits, init_values, options);

r_time_limits = [first_times(end), first_times(end) + 5];
[second_times, second_output] = ode45(@released_flow, r_time_limits, first_output(end, :));

times = [first_times(1:end - 1); second_times];
output = [first_output(1:end - 1, :); second_output];

X = output(:,1);
Y = output(:,2);
comet(X,Y)