function flow_event_test_two(flow_handle, events_handle)
% FLOW_EVENT_TEST  plots animation of swinging pendulum in polar coordinates
% events_handle is optional.

    switch nargin
    case 2
      use_events = true;
    otherwise
      use_events = false;
    end

    init_values = [3*pi/4, 1, 0, 0]; % position, [Angle (radians), Length (m), dA, dL]
    time_limits = [0 10]; % in seconds
    
    if use_events
        options = odeset('Events', events_handle);
        [times, output] = ode45(flow_handle, time_limits, init_values, options);
    else
        [times, output] = ode45(flow_handle, time_limits, init_values);
    end
    
    A = output(:,1);
    L = output(:,2);
    comet(A,L);
end