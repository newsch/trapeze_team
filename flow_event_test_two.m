function flow_event_test_two(flow_handle1, flow_handle2, events_handle)
% FLOW_EVENT_TEST  plots animation of swinging pendulum in polar coordinates
% events_handle is optional.

    release_time = 0.7;
    end_time = release_time + 1;
    
    switch nargin
    case 3
      use_events = true;
    otherwise
      use_events = false;
    end

    init_values = [pi/2, 1, 0, 0]; % position, [Angle (radians), Length (m), dA, dL]
    
    if use_events
        options = odeset('Events', events_handle);
        [times, output] = ode45(flow_handle1, [0 release_time], init_values, options);
    else
        [times, output] = ode45(flow_handle1, [0 release_time], init_values);
    end
    
    A = output(:,1);
    L = output(:,2);
    for i=1:size(A)-1
        X(i) = L(i)*(-sin(A(i)));
        Y(i) = L(i)*(-cos(A(i)));
    end
    for i=1:size(A)-1
        w = size(A);
        if(i>1)
            if(i<(w(1)-1))
                vX(i) = X(i+1) - X(i);
                vY(i) = Y(i+1) - Y(i);
            end
        end
    end
    
    mid_values = [X(end),Y(end),vX(end),vY(end)];
    
    [times1, output1] = ode45(flow_handle2, [release_time end_time], mid_values);
    
    Xfin = output1(:,1);
    Yfin = output1(:,2);
    
    %comet(X,Y);
    %polar(A-pi/2,L);
    %comet(A,L);
    %plot(Xfin,Yfin);
    
    compiler_n_plotter(A,L,Xfin,Yfin);
    
end