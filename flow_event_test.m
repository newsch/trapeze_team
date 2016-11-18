function first_iteration_tester(flow_handle, events_handle)
% FIRST_ITERATION_TESTER  plots animation of swinging pendulum
% events_handle is optional.

    switch nargin
    case 2
      use_events = true;
    otherwise
      use_events = false;
    end

    init_values = [-1, -1, 0, 0]; % position, in meters
    time_limits = [0 5]; % in seconds
    
    if use_events
        options = odeset('Events', events_handle);
        [times, output] = ode45(flow_handle, time_limits, init_values, options);
    else
        [times, output] = ode45(flow_handle, time_limits, init_values);
    end
    
    X = output(:,1);
    Y = output(:,2);
    comet(X,Y);
end
